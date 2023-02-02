# Maintainer: Sebastien Duthil <duthils@duthils.net>

pkgname=snoopy-logger
_upstream_pkgname=snoopy
pkgver=2.5.1
pkgrel=1
pkgdesc="A small library that logs all program executions"
arch=('x86_64')
url="https://github.com/a2o/snoopy"
license=('GPL2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/a2o/${_upstream_pkgname}/archive/refs/tags/${_upstream_pkgname}-${pkgver}.tar.gz)
sha512sums=('2c0cde306ff58fe7f19c4df9aecab2c6936d71b77471bbb363ca660254b780a6874163988ebc6882b75d18319891bd1d5b5ef524f158f7645466c93e4dbe987f')

build() {
  cd "$srcdir/${_upstream_pkgname}-${_upstream_pkgname}-${pkgver}"

  ./bootstrap.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/${_upstream_pkgname}-${_upstream_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" install
}
