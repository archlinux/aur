# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=emojione-color-font
pkgver=1.0_beta3
pkgrel=4
pkgdesc="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/emojione-color-font"
license=('custom:CCPL:by-4.0' 'MIT')

depends=(fontconfig)
optdepends=('ttf-bitstream-vera: for bug-free font fallback')

_pkgver=${pkgver//_/-}

source=(
  "https://github.com/eosrei/$pkgname/releases/download/v${_pkgver}/EmojiOneColor-SVGinOT-Linux-${_pkgver}.zip"
  "https://github.com/eosrei/$pkgname/archive/v${_pkgver}.tar.gz"
)
install=$pkgname.install

_srcdir=${pkgname}-${_pkgver}

package() {
  install -Dm644 EmojiOneColor-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/"Emoji One Color"/
  install -Dm644 ${_srcdir}/{LICENSE.md,LICENSE-CC-BY.txt,LICENSE-MIT.txt} -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md ${_srcdir}/full-demo.html -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 fontconfig/user-bitstream-vera-fonts.conf "$pkgdir"/etc/fonts/conf.avail/56-$pkgname.conf
}

md5sums=('dcfaaf965fc2e62aeaa70c209e8b3323'
         'b42654792cadfa00ab6dfc65a400f69a')
