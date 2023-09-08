pkgname=glava-ridged
pkgver=1.0.0
pkgrel=1
pkgdesc="GLava-Ridged - OpenGL audio visualizer (Fork of GLava)"
arch=('x86_64')
url="https://git.pixelridgesoftworks.com/PixelRidge-Softworks/glava-ridged.git"
license=('GPL')
depends=('glfw-x11' 'pulseaudio' 'libconfig' 'fftw')
makedepends=('cmake' 'make' 'git')
source=("git+${url}")  # Cloning the entire repo
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
