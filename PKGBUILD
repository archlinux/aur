# Maintainer: Pig Monkey <pm@pig-monkey.com>
#
# Contributor: portix <portix at gmx.net>

pkgname=srandrd
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple randr daemon that reacts to monitor hotplug events" 
arch=('i686' 'x86_64')
url="https://github.com/jceb/srandrd/"
license=('custom:MIT/X')
depends=('libxrandr')
provides=('srandrd')
source=(https://github.com/jceb/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('91041c39b46e7c8e8f7401a74cdaab10')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
