# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=botocore-stubs
_srcname=${_name//-/_}
pkgname=python-${_name}
pkgver=1.31.38
pkgrel=1
pkgdesc='Type annotations and code completion for botocore package'
arch=('any')
url="https://pypi.org/project/botocore-stubs"
makedepends=('python-setuptools')
depends=('python' 'python-botocore')
license=('MIT')
source=("https://files.pythonhosted.org/packages/1e/95/936de5991cd2f2eede891d1612ccce43d1bbeaf64329d1784357cd8574e6/${_srcname}-${pkgver}.tar.gz")
sha256sums=(66076ec073cfa16f913ccb6e76df06b2080974786040d63a9a8d297459ebcae7)

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
