# Maintainer: Dan McCurry <dan.mccurry at linux dot com>

pkgname=texlive-newtx
pkgver=1.519b
pkgrel=1
pkgdesc="Alternative uses of the TX fonts, with improved metrics."
arch=('any')
depends=('texlive-bin')
url="http://ctan.org/pkg/${pkgname/texlive-/}"
license=('custom: LaTeX Project Public License 1.3c')
source=("http://mirrors.ctan.org/install/fonts/${pkgname/texlive-/}.tds.zip"
	# LaTeX Project Public License
	"lppl.txt::http://latex-project.org/lppl/lppl-1-3c.txt")
noextract=("${pkgname/texlive-/}.tds.zip")
install=$pkgname.install
sha1sums=('ce61a6a5d7e3ef3524e6695d73fa8dce8cd501bf'
          '47438d5b2ab351796b64b62da105432ab71369ab')

package() {
  mkdir -p "$pkgdir"/usr/share/texmf/
  unzip "$srcdir/${pkgname/texlive-/}".tds.zip -d "$pkgdir"/usr/share/texmf/
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
  install -Dm644 "$srcdir"/lppl.txt \
	  "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

