# Contributor: xduugu
pkgname=ofxstatement-bubbas-git
pkgver=r8.e26e3e5
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}
