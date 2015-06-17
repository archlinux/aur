# Contributor: Filipp "Scorp" Andjelo <scorp@mailueberfall.de>

pkgname=syslog-notify
pkgver=0.1
pkgrel=2
pkgdesc="Pop-up display for system log messages"
arch=('i686' 'x86_64')
url="http://jtniehof.github.com/syslog-notify"
license=('GPL')
depends=('libnotify')
install=${pkgname}.install
source=(http://cloud.github.com/downloads/jtniehof/syslog-notify/${pkgname}-${pkgver}.tar.bz2
       ${pkgname}.patch)
md5sums=('18474e11ceb0add6e8b70fe7680f0abf'
         '3dc49b913d4ee1a00426fb993770084d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/${pkgname}.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
