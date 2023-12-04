# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=python-recordclass
_pkgname=recordclass
pkgver=0.21.1
pkgrel=1
pkgdesc="Mutable variant of namedtuple"
arch=('any')
url="https://pypi.org/project/recordclass"
license=('MIT')
depends=('python' 'cython')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fa2343dc24ef457f5f1c09e34fccada2d9074f582287f9fedb195bfbc1a9af92')

build(){
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
