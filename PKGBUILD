# Maintainer: SykikXO <xo.sykik@gmail.com>
pkgname=fey
pkgver=1.0
pkgrel=2
pkgdesc="A high-performance, minimalistic Wayland image viewer with GIF and physics support"
arch=('x86_64')
url="https://github.com/SykikXO/fey"
license=('MIT')
depends=('cairo' 'wayland' 'exiv2' 'imlib2')
makedepends=('git' 'wayland-protocols')
provides=('fey')
conflicts=('fey')
source=("fey::git+https://github.com/SykikXO/fey.git#commit=971744f6a02db86be555fe0fe4da601ce3547bfa")
sha256sums=('SKIP')

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
