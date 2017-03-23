# Maintainer: Jakub Janeczko <jjaneczk@gmail.com>
pkgname=ofxstatement-polish-git
pkgver=r3.d1e49d7
pkgrel=1
pkgdesc="ofxstatement support for some Polish banks and financial institutions"
arch=('any')
url="https://github.com/yay6/ofxstatement-polish"
license=('GPL3')
depends=('ofxstatement')
makedepends=('git')
source=('git+https://github.com/yay6/ofxstatement-polish')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
