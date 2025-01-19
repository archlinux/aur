# Maintainer: Sebastien Duthil <duthils@duthils.net>

pkgname=snoopy-logger
_upstream_pkgname=snoopy
pkgver=2.5.2
pkgrel=1
pkgdesc="A small library that logs all program executions"
arch=('x86_64')
url="https://github.com/a2o/snoopy"
license=('GPL2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/a2o/${_upstream_pkgname}/archive/refs/tags/${_upstream_pkgname}-${pkgver}.tar.gz)
sha512sums=('f4d7cb03920a9bbacd065d4ad2d1f41ed2f2952a6ff74c0522f3210988744e48a479f755bf77561c5fb8d4a543c27190e45751fbddbe1fba854acdd3c5c80f8c')

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
