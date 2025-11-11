# Maintainer: vuillaume <vuillaume12 at yahooo dot com>
# Contributor: yannsen <ynnsen@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
pkgname=tn5250
pkgver=0.18.0
pkgrel=1
pkgdesc='A 5250 terminal emulator for IBM iSeries and AS400'
arch=('i686' 'x86_64')
url="https://github.com/tn5250/tn5250"
license=('LGPL2.1')
depends=('openssl' 'ncurses')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b936d39d5210fe447245cf08778655a48876ae2dfcb67373910163602128a919')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
