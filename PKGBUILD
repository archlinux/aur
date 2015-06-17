# Maintainer : ava1ar <mail(at)ava1ar(dot)me>

pkgname=wxsqlite3-2.8
_pkgname=wxsqlite3
pkgver=3.1.1
pkgrel=1
pkgdesc="wxWidgets wrapper for SQLite3, build for wxWidgets 2.8"
arch=('i686' 'x86_64')
url="http://wxcode.sourceforge.net/components/wxsqlite3/"
license=('custom:wxWindows')
depends=('wxgtk2.8' 'sqlite3')
source=("http://downloads.sourceforge.net/wxcode/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('a7be92b441b26dfdb94908eb6ac96ee4a0ed335b')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
  make
}
      
package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  # license
  install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
