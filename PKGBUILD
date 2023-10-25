# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ansible-cmdb
pkgver=1.31
pkgrel=1
pkgdesc="Generate host overview from ansible fact gathering output."
arch=('any')
url="https://github.com/fboender/ansible-cmdb"
license=('GPL3')
depends=('python' 'python-mako' 'python-pyyaml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8de9a02e3f0740967537850f6263756dca1bf506cd95c1f2ef7f4ee6d9ff23b8')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  python setup.py install --root="$pkgdir/" --optimize=1
}
