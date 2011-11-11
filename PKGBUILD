# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Andreas Zwinkau <beza1e1@web.de>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=python-pigment
pkgver=0.3.12
pkgrel=2
pkgdesc="Pigment Python library and bindings"
arch=('i686' 'x86_64')
url="https://code.fluendo.com/pigment/trac"
license=('GPL')
depends=('python2' 'pigment>=0.3.15' 'pygobject')
options=('!libtool')
source=(http://elisa.fluendo.com/static/download/pigment/pigment-python-$pkgver.tar.gz)

md5sums=('dd42ce291be4d37d9a933c9e3cd71590')
build() {
  cd "$srcdir/pigment-python-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
