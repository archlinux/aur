# Maintainer: Pig Monkey <pm@pig-monkey.com>
#
# Contributor: portix <portix at gmx.net>

pkgname=srandrd
pkgver=0.6.3
pkgrel=1
pkgdesc="Simple randr daemon that reacts to monitor hotplug events" 
arch=('i686' 'x86_64')
url="https://github.com/jceb/srandrd/"
license=('custom:MIT/X')
depends=('libxrandr' 'libxinerama')
source=(https://github.com/jceb/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d59a4c5eb611378b5efaca9c2b554934265da0ea1ec72fddef3368f270eeb520')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
