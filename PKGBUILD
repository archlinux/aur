# Maintainer: Edward Toroshchyn <aur@hades.name>
pkgname=ofxstatement-revolut-git
pkgver=r87.7bce386
pkgrel=1
pkgdesc="ofxstatement support for Revolut"
arch=('any')
url="https://github.com/hades/ofxstatement-revolut.git"
license=('GPL-3')
depends=('ofxstatement')
makedepends=('git')
source=('git+https://github.com/hades/ofxstatement-revolut')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
