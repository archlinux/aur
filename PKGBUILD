# Maintainer:
pkgname=ttf-gentium-plus
_pkgname=GentiumPlus
_pkgsubname=Compact
pkgver=5.000
pkgrel=1
pkgdesc="Fonts based on the original Gentium design with more extended Latin glyphs (Unicode 5.1), archaic Greek symbols, and full extended Cyrillic script support"
arch=('any')
url="http://scripts.sil.org/Gentium"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('unzip')
conflicts=('ttf-sil-fonts')
install=ttf.install
source=("http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=$_pkgname-$pkgver.zip&filename=$_pkgname-$pkgver.zip"
        "http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=GentiumPlusCompact-5.000b.zip&filename=GentiumPlusCompact-5.000.zip")
sha256sums=('335911f17bd2de4e43742e1d0367cfeff19a90abf7ed604f100a42705042e154'
            '1d8a4ff03dce90f6002b008a5e37f890c409bc22e4e26561b67f3f3c40991b5c')


package() {
  cd "${_pkgname}-${pkgver}"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  install -d  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
  cd "$srcdir/$_pkgname$_pkgsubname-$pkgver"
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}

