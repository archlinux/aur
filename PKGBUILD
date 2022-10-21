# Maintainer: Rigo Reddig <rigo.reddig@gmail.com>
pkgname=textshot-git
_pkgname=textshot
pkgver=r86.a91c188
pkgrel=1
pkgdesc="Python tool for grabbing text via screenshot"
arch=('any')
url="https://github.com/ianzhao05/textshot"
license=('MIT')
makedepends=()
depends=('tesseract' 'tesseract-data-eng' 'python-entrypoint2' 'python-easyprocess' 'python-mss' 'python-pillow' 'python-pyperclip' 'python-pyqt5' 'python-pyqt5-sip' 'python-pyscreenshot' 'python-pytesseract' )
optdepends=('tesseract-data')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/ianzhao05/textshot.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm755 "textshot.py" "$pkgdir/usr/bin/textshot"
}
