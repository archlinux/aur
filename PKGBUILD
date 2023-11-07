# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: gardar <aur AT gardar DOT net>

pkgname=ansible-cmdb
pkgver=1.31
pkgrel=3
pkgdesc="Generate host overview from ansible fact gathering output."
arch=('any')
url="https://github.com/fboender/ansible-cmdb"
license=('GPL3')
depends=('python' 'python-mako' 'python-pyyaml' 'python-jsonxs')
makedepends=('python-setuptools' 'git' 'python-build' 'python-installer' 'python-wheel')
# source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("git+https://github.com/gardar/ansible-cmdb.git#branch=fix-build")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  python -m build
}

package() {
  cd "$srcdir/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
