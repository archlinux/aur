# Maintainer: Kenneth Henderick <kenneth@ketronic.be>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: : philomath <philomath868 at gmail dot com>
# Contributor: Florian "Bluewind" Pritz <flo at xssn dot at>
# Contributor: Tim Karreman <tim at karreman dot net>

# Version 20170806 md5=47c43cf1ee013e55fc5250bbf102d556 
pkgname=mbuffer
pkgver=20170806
pkgrel=1
pkgdesc="a tool for buffering data streams"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/mbuffer.html"
license=('GPL3')
depends=('openssl')
source=(http://www.maier-komor.de/software/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('47c43cf1ee013e55fc5250bbf102d556')

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
