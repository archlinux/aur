# Maintainer: Kenneth Henderick <kenneth@ketronic.be>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: : philomath <philomath868 at gmail dot com>
# Contributor: Florian "Bluewind" Pritz <flo at xssn dot at>
# Contributor: Tim Karreman <tim at karreman dot net>

# Version 20171011 md5=4e23fe909fe4e53a7cef03abf6c44a98
pkgname=mbuffer
pkgver=20171011
pkgrel=2
pkgdesc="a tool for buffering data streams"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/mbuffer.html"
license=('GPL3')
depends=('openssl')
source=(http://www.maier-komor.de/software/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('4e23fe909fe4e53a7cef03abf6c44a98')

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
