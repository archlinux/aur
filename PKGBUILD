# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: eagletmt <eagletmt@gmail.com>
pkgname=ttf-ricty
pkgver=3.2.4
pkgrel=2
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
  ./ricty_generator.sh /usr/share/fonts/{OTF/Inconsolata.otf,TTF/migu-1m-regular.ttf,TTF/migu-1m-bold.ttf}
}

package() {
  cd "$srcdir/Ricty-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/licenses/$pkgname/"
}

sha1sums=('7fc8adcc74656d9e2e1acd325de82f0f08a6d222')
