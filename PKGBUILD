# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=libtickit-bzr
pkgver=r322
pkgrel=1
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libtickit'
license=('MIT')
depends=('libtermkey' 'unibilium>=1.1.0')
makedepends=('bzr')
conflicts=('libtickit')
provides=("libtickit=${pkgver}")
source=("${pkgname}::bzr+http://bazaar.leonerd.org.uk/c/libtickit/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
