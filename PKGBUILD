# Maintainers: edoz90

pkgname=t50
_major=5
_minor=7
_rev=0
pkgver=${_major}.${_minor}.${_rev}
pkgrel=1
pkgdesc="T50 (f.k.a. F22 Raptor) is a tool designed to perform 'Stress Testing'"
arch=('i686' 'x86_64')
url="https://github.com/fredericopissarra/t50"
license=('GPLv2')
provides=("t50")

source=("${pkgname}.tar.gz::https://github.com/fredericopissarra/t50/archive/v${pkgver}.tar.gz")
md5sums=('51ad7a01543cd07ecb19882eed6ff0ee')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set et sw=2 sts=2 tw=80:
