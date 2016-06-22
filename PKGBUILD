# Contributor: xduugu
pkgname=ofxstatement-bubbas-git
pkgver=8.e26e3e5
pkgrel=1
pkgdesc="Plugins for ofxstatement for DKB and Amazon credit cards"
arch=('any')
url="https://github.com/bubbas/ofxstatement-bubbas"
license=('GPL')
depends=('ofxstatement')
makedepends=('git')
source=('git+https://github.com/bubbas/ofxstatement-bubbas.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
