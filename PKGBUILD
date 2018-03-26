# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: eagletmt <eagletmt@gmail.com>
pkgname=ttf-ricty
pkgver=4.1.1
pkgrel=1
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Migu 1M.'
arch=('any')
url='http://www.rs.tus.ac.jp/yyusa/ricty.html'
license=('custom')
depends=()
makedepends=('fontforge' 'ttf-inconsolata' 'ttf-migu')
install=ttf.install
source=('http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator-4.1.1.sh')
sha256sums=('86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d')

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
}
