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
source=("fey::git+https://github.com/SykikXO/fey.git#commit=26265b833bd2b179cf1ac4b9eba658a552e18892")
sha256sums=('ae903c72fbb1c91425b9990b98e20d0af6c540e0667e2f5bf7e50763f43f9331')

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
