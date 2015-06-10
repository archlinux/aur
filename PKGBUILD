# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# See https://github.com/benalexau/libtwsapi-aur for AUR PKGBUILD history

pkgname=libtwsapi
pkgver=0.6.0
pkgrel=1
pkgdesc='Portable C++ API for Interactive Brokers'
arch=('any')
url="https://github.com/rudimeier/twsapi"
license=('custom')
depends=('gcc-libs')
source=('https://bitbucket.org/rudimeier/twsapi/downloads/twsapi-0.6.0.tar.gz')
md5sums=('e3f9c21f3a79eb9fda89b182c541070b')

build() {
  cd ${srcdir}/twsapi-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/twsapi-${pkgver}
  make DESTDIR="$pkgdir/" install
}
