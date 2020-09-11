# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Sam101 <zoetrem @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>
# Contributor: Huulivoide

pkgname=zsxd
pkgver=1.12.2
pkgrel=3
pkgdesc="The Legend of Zelda XD: Mystery of Solarus - Parodic fangame"
arch=('any')
url="http://www.zelda-solarus.com/"
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'zip')
changelog="$pkgname.changelog"
source=("https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('1cba628a427cae10e0b08498690b95ef5a60f62531b1b4c7635ccbd561201ff54511b5c32e8e5e3251625e08276466ef2faa81f62eb2b67669cc001b00b7f215')

build() {
  cd "${pkgname}-v${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


