# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Harry Jeffery <me@harry.pm>

pkgname=libgrapheme
pkgver=2.0.2
pkgrel=2
pkgdesc="unicode string library"
url="https://libs.suckless.org/libgrapheme/"
license=("ISC")
arch=("x86_64")
conflicts=("libgrapheme")
source=("https://dl.suckless.org/libgrapheme/libgrapheme-${pkgver}.tar.gz")
sha256sums=('a68bbddde76bd55ba5d64116ce5e42a13df045c81c0852de9ab60896aa143125')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LDCONFIG= all
}

check() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LDCONFIG= test
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" LDCONFIG= install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
