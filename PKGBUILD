# Maintainer: VetheonGames <vetheon@pixelridgesoftworks.com>
pkgname=glava-ridged
pkgver=1.0.0
pkgrel=1
pkgdesc="GLava-Ridged - OpenGL audio visualizer (Fork of GLava)"
arch=('x86_64')
url="https://git.pixelridgesoftworks.com/PixelRidge-Softworks/glava-ridged.git"
license=('GPL')
depends=('glfw-x11' 'pulseaudio' 'libconfig' 'fftw')
makedepends=('git' 'meson' 'ninja')
optdepends=('obs-studio: for optional OBS support')
source=("git+${url}")  # Cloning the entire repo
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
