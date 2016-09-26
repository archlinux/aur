# Maintainer: Dan McCurry <dan.mccurry at linux dot com>

_basename=newtx
pkgname=texlive-"$_basename"
pkgver=1.5
pkgrel=1
pkgdesc="Alternative uses of the TX fonts, with improved metrics."
arch=('any')
depends=('texlive-bin')
url="http://ctan.org/pkg/$_basename"
license=('custom: LaTeX Project Public License 1.3c')
source=("http://mirrors.ctan.org/install/fonts/$_basename.tds.zip"
	# LaTeX Project Public License
	"lppl.txt::http://latex-project.org/lppl/lppl-1-3c.txt")
noextract=("$_basename.tds.zip")
install=$pkgname.install
sha1sums=('486b379ea9c8731183e1f747ad0e537f85577053'
          '47438d5b2ab351796b64b62da105432ab71369ab')

package() {
  mkdir -p "$pkgdir"/usr/share/texmf/
  unzip "$srcdir/$_basename".tds.zip -d "$pkgdir"/usr/share/texmf/
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
  install -Dm644 "$srcdir"/lppl.txt \
	  "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

