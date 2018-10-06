# Maintainer: Niclas Meyer <niclas at countingsort dot com>

pkgname=sequestrum-git
pkgver=1.4.1
pkgrel=1
pkgdesc="Modern, feature-packed dotfile manager"
arch=('any')
url="https://github.com/iiPlasma/sequestrum"
license=('MIT')
depends=('python' 'python-pyaml')
makedepends=('git')
provides=('sequestrum')
conflicts=('sequestrum')
source=("$pkgname::git+https://github.com/iiPlasma/sequestrum")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed -e 's/-/_/g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py -q install --root="$pkgdir"
}
