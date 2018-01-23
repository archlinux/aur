# Maintainer: Alisa Dammer <alisa,dammer@gmail.com>
# Contributor: Jaroslav Janukevic (janukevic <at> gmail <dot> com)
# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: samuellittley <supersam.littley@gmail.com>
pkgname=xprintidle
pkgver=0.2.2
pkgrel=1
pkgdesc="Print X idle time"
arch=('x86_64')
license=('GPL2')
depends=('libxss')
url="https://github.com/g0hl1n/xprintidle"
source=("https://github.com/g0hl1n/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7755ad4a35773349de1b432fda24ac51b14e8e989fe2ad7c98af214ce7b2f45e5b527758933bcc84c6625199e2b38ef0bd3f18f622ce6e84b0cf321476606cc8')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --x-libraries=/usr/lib
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" install
}
