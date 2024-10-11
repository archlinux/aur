# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname=ttf-noto-sans-egyptian-hieroglyphs
_pkgname=NotoSansEgyptianHieroglyphs
pkgver=2.002
pkgrel=0
pkgdesc="Noto Sans font for egyptian hieroglyphs"
arch=('any')
url='https://github.com/notofonts/egyptian-hieroglyphs'
license=('OFL-1.1')
source=("$url/releases/download/$_pkgname-v$pkgver/$_pkgname-v$pkgver.zip")
md5sums=(39d2005c293676926234d4edfb5bc858)

pkgver() {
  curl -s "https://api.github.com/repos/${url#*github.com/}/releases/latest" | grep -Fm1 "$_pkgname-v" | sed 's/^.*-v//; s/",$//; s/\.zip$//'
}

package() {
  install -m644 -Dt "$pkgdir/usr/share/fonts/TTF/" "$srcdir/$_pkgname/hinted/ttf/$_pkgname-Regular.ttf"
  install -m644 -Dt "$pkgdir/usr/share/licenses/noto-fonts-hieroglyphs/" "$srcdir/"*.{txt,html}
}
