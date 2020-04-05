# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: eagletmt <eagletmt@gmail.com>
pkgname=ttf-ricty
pkgver=4.1.1
pkgrel=3
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Migu 1M.'
arch=('any')
url='https://rictyfonts.github.io/'
license=('custom')
depends=()
makedepends=('fontforge' 'ttf-inconsolata' 'ttf-migu')
install=ttf.install
source=('https://rictyfonts.github.io/files/ricty_generator-4.1.1.sh' 'OFL.txt' 'ipa_font_license_agreement_v1.txt')
sha256sums=('86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d' 'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3' '87fce322b6a982ed1fb713fea8ae5531aed77792c4d10b1efb17050e5edb41ab')

build() {
  cd "$srcdir"
  chmod +x ./ricty_generator-${pkgver}.sh
  ./ricty_generator-${pkgver}.sh -dr0 /usr/share/fonts/TTF/{Inconsolata-Regular.ttf,Inconsolata-Bold.ttf,migu-1m-regular.ttf,migu-1m-bold.ttf}
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 ipa_font_license_agreement_v1.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
