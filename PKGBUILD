# Maintainer: Pig Monkey <pm@pig-monkey.com>
#
# Contributor: portix <portix at gmx.net>

pkgname=srandrd
pkgver=0.5
pkgrel=1
pkgdesc="Simple randr daemon that reacts to monitor hotplug events" 
arch=('i686' 'x86_64')
url="http://portix.bitbucket.org/srandrd/"
license=('custom:MIT/X')
depends=('libxrandr')
provides=('srandrd')
source=(https://bitbucket.org/portix/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('37cace6825b71cc76ca6fb039ff2b06a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
