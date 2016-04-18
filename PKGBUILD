# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=twemoji-color-font
pkgver=1.0_beta1
pkgrel=3
pkgdesc="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/twemoji-color-font"
license=('custom:CCPL:by-4.0' 'MIT')

depends=(fontconfig)
optdepends=('ttf-bitstream-vera: for bug-free font fallback')

_pkgver=${pkgver//_/-}

source=(
  "https://github.com/eosrei/$pkgname/releases/download/v${_pkgver}/TwitterColorEmoji-SVGinOT-${_pkgver}.zip"
  "https://github.com/eosrei/$pkgname/archive/v${_pkgver}.tar.gz"
)
install=$pkgname.install

_srcdir=${pkgname}-${_pkgver}

package() {
  install -Dm644 TwitterColorEmoji-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/"Twitter Color Emoji"/
  install -Dm644 ${_srcdir}/LICENSE-CC-BY.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-CC-BY
  install -Dm644 ${_srcdir}/LICENSE-MIT.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
  install -Dm644 ${_srcdir}/README.md "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 ${_srcdir}/linux/fontconfig/user-bitstream-vera-fonts.conf "$pkgdir"/etc/fonts/conf.avail/56-$pkgname.conf
}

md5sums=('456fa7a3615550287926fe573bde2872'
         '5da62dc4daa6859adec2a83ad75681b7')
