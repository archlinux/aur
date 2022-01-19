# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor:  DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
pkgname=sope
pkgdesc="application server used by SOGo"
pkgver=5.5.0
pkgrel=1
arch=(x86_64)
url="http://www.sogo.nu/files/downloads/SOGo/Sources/"
license=('GPL')
options=('!strip')
replaces=('sope2')
depends=('gnustep-base')
makedepends=('gcc-objc'
             'gnustep-make'
             'libxml2'
             'libmariadbclient'
             'libldap'
             'openssl'
             'postgresql-libs')
optdepends=('libxml2: parse XML coniguration files'
            'mariadb: run database server for sogo locally'
            'openldap: run directory server for sogo locally'
            'openssl: create SSL secured connectons'
            'postgresql: run database server for sogo locally')
source=("https://packages.inverse.ca/SOGo/sources/SOPE-${pkgver}.tar.gz")
sha256sums=('dde493ad53b2cda85fc40972836cf41188d3ec96a2b80ea263a085cedb39afd0')

build() {
  cd SOPE
  ./configure --with-gnustep --disable-strip --disable-debug
  make
}

package() {
  cd SOPE
  make install DESTDIR="${pkgdir}"
}
