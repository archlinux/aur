# Maintainer: Kenneth Henderick <kenneth@ketronic.be>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: : philomath <philomath868 at gmail dot com>
# Contributor: Florian "Bluewind" Pritz <flo at xssn dot at>
# Contributor: Tim Karreman <tim at karreman dot net>

pkgname=mbuffer
pkgver=20151002
pkgrel=1
pkgdesc="a tool for buffering data streams"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/mbuffer.html"
license=('GPL3')
depends=('openssl')
source=(http://www.maier-komor.de/software/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('b2d20c4d880518c5fb8f8db734962f45')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
  --disable-debug
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
