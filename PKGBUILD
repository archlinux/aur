# Maintainer: SykikXO <xo.sykik@gmail.com>
pkgname=fey
pkgver=1.0
pkgrel=1
pkgdesc="A high-performance, minimalistic Wayland image viewer with GIF and physics support"
arch=('x86_64')
url="https://github.com/SykikXO/fey"
license=('MIT')
depends=('cairo' 'wayland' 'exiv2' 'imlib2')
makedepends=('git' 'wayland-protocols')
provides=('fey')
conflicts=('fey')
source=("fey::git+https://github.com/SykikXO/fey.git#tag=v1.0")
sha256sums=('748e6fc884a75e0b691df999ead9936f9f7848d74befa14d8fc3b458dc8daddc')

build() {
  cd "fey"
  make
}

package() {
  cd "fey"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
