# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=botocore-stubs
_srcname=${_name//-/_}
pkgname=python-${_name}
pkgver=1.29.16
pkgrel=1
pkgdesc='Type annotations and code completion for botocore package'
arch=('any')
url="https://pypi.org/project/botocore-stubs"
makedepends=('python-setuptools')
depends=('python' 'python-botocore')
license=('MIT')
source=("https://files.pythonhosted.org/packages/3c/b9/9e26c03deedc10b5cd7e8ce9c21d5fc360362d69cda29ac99142d92745fd/${_srcname}-${pkgver}.tar.gz")
sha256sums=(9378e8e771f164f53bd18d33455f211d7e1e4582b850a21329712686d63d46d4)

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
