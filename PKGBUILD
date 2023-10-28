# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ansible-cmdb
pkgver=1.31
pkgrel=2
pkgdesc="Generate host overview from ansible fact gathering output."
arch=('any')
url="https://github.com/fboender/ansible-cmdb"
license=('GPL3')
depends=('python' 'python-mako' 'python-pyyaml')
makedepends=('python-setuptools' 'git')
# source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("git+https://github.com/gardar/ansible-cmdb.git#branch=fix-build")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  python setup.py install --root="$pkgdir/" --optimize=1
}
