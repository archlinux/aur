pkgname=xava
pkgver=0.7.0.0
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'wayland-protocols' 'libx11' 'sdl2' 'portaudio'
  'libpulse' 'sndio' 'mesa' 'pipewire' 'glew')
makedepends=('cmake' 'git')
source=('$pkgname-$pkgver.tar.gz::https://github.com/nikp123/xava/archive/0.7.0.0.tar.gz')
conflicts=('xava-git')
provides=('xava')
sha256sums=('SKIP')

build() {
  mkdir -p "${pkgname}-${pkgver}"/build
  cd       "${pkgname}-${pkgver}"/build
  cmake -DXAVA_LINK_TO_INSTALL_DIR=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir"/usr ..
  make
}

package() {
  # Install binaries
  cd "${pkgname}-${pkgver}"/build
    make install
  cd ../..
}

