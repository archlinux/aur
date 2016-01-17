# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: eagletmt <eagletmt@gmail.com>
pkgname=ttf-ricty
pkgver=4.0.0
pkgrel=1
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Migu 1M.'
arch=('any')
url='https://github.com/yascentur/Ricty'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge' 'ttf-inconsolata>=20090215-4' 'ttf-migu')
install=ttf.install
source=(Ricty-$pkgver.tar.gz::https://github.com/yascentur/Ricty/archive/$pkgver.tar.gz)

build() {
  cd "$srcdir/Ricty-$pkgver"
  ./ricty_generator.sh /usr/share/fonts/TTF/{Inconsolata-Regular.ttf,Inconsolata-Bold.ttf,migu-1m-regular.ttf,migu-1m-bold.ttf}
}

package() {
  cd "$srcdir/Ricty-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/licenses/$pkgname/"
}

sha1sums=('8e821ad575cd17fc0d3104cc4941c53c5523e7ba')
