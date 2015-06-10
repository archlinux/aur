# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# See https://github.com/benalexau/twstools-aur for AUR PKGBUILD history

pkgname=twstools
pkgver=0.4.3
pkgrel=1
pkgdesc='Command line tools around Interactive Brokers TWS API'
arch=('any')
url="https://github.com/rudimeier/twstools"
license=('BSD')
depends=('libtwsapi')
source=('https://bitbucket.org/rudimeier/twstools/downloads/twstools-0.4.3.tar.gz')
md5sums=('527f71d5def8359ffd5c7b4bc8a07547')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
