# Maintainer: Dan McCurry <dan.mccurry at linux dot com>

_basename=newtx
pkgname=texlive-"$_basename"
pkgver=1.466
pkgrel=3
pkgdesc="Alternative uses of the TX fonts, with improved metrics."
arch=('any')
depends=('texlive-bin')
url="http://ctan.org/pkg/$_basename"
license=('custom: LaTeX Project Public License 1.3c')
source=("http://mirrors.ctan.org/fonts/$_basename.zip"
	# LaTeX Project Public License
	"lppl.txt::http://latex-project.org/lppl/lppl-1-3c.txt")
noextract=("$_basename.zip")
install=$pkgname.install
sha1sums=('983fd8e0b5c17064af3ec42ba47dc80fc24d33bf'
          '47438d5b2ab351796b64b62da105432ab71369ab')

package() {
  mkdir -p "$pkgdir"/usr/share/texmf/
  unzip "$srcdir/$_basename".zip -d "$pkgdir"/usr/share/texmf/
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
  install -Dm644 "$srcdir"/lppl.txt \
	  "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

