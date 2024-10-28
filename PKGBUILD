# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=python-recordclass
_pkgname=recordclass
pkgver=0.22.1
pkgrel=1
pkgdesc="Mutable variant of namedtuple"
arch=('any')
url="https://pypi.org/project/recordclass"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80a4c79270edb8fb55bcb96bec0159a292b485c997e2f33b38fdc9e8d6c0c315')

build(){
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
