# Maintainer: Dan McCurry <dan.mccurry at linux dot com>

_basename=newtx
pkgname=texlive-"$_basename"
pkgver=1.466
pkgrel=1
pkgdesc="Alternative uses of the TX fonts, with improved metrics."
arch=('any')
depends=('texlive-bin')
makedepends=('unzip')
url="http://ctan.org/pkg/$_basename"
license=('custom: LaTeX Project Public License 1.3c')
source=("http://mirrors.ctan.org/install/fonts/$_basename.tds.zip"
	# LaTeX Project Public License
	"http://latex-project.org/lppl.txt")
noextract=("$_basename.tds.zip")
install=$pkgname.install
sha1sums=('ded2e1077edec121a1ddae058963cdec7676a376'
          '47438d5b2ab351796b64b62da105432ab71369ab')

package() {
  mkdir -p "$pkgdir"/usr/share/texmf/
  unzip "$srcdir/$_basename".tds.zip -d "$pkgdir"/usr/share/texmf/
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
  install -Dm644 "$srcdir"/lppl.txt \
	  "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

