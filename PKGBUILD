# Maintainer: Roberto Nobrega <rwnobrega@gmail.com>
pkgname=natpos-sdr
pkgver=59a
pkgrel=2
pkgdesc="A Linux based SDR program similar in operation and features to other programs like Gqrx, HDSDR, and SDR#"
arch=('i686' 'x86_64')
url="http://www.ecstaticlyrics.com/radio/sdr/natpos/"
license=('custom:Antiviral')
depends=('rtl-sdr' 'alsa-lib' 'glfw')
makedepends=()
optdepends=()
source=("http://www.ecstaticlyrics.com/radio/sdr/natpos/download/natpos-$pkgver.tgz")
md5sums=('84acbf3239f9461543ba9a4e4d6db23e')

build() {
  cd "natpos-$pkgver"

  ./compile
}

package() {
  cd "natpos-$pkgver"

  install -D -m755 natpos "${pkgdir}/usr/bin/natpos"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
