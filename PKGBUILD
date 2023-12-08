# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=botocore-stubs
_srcname=${_name//-/_}
pkgname=python-${_name}
pkgver=1.31.64
pkgrel=2
pkgdesc='Type annotations and code completion for botocore package'
arch=('any')
url="https://pypi.org/project/botocore-stubs"
makedepends=('python-build')
depends=('python' 'python-botocore')
license=('MIT')
source=("https://files.pythonhosted.org/packages/28/e9/423f503663f0fd7682219657fd777131b3222d845247f157b873f85d17eb/${_srcname}-${pkgver}.tar.gz")
sha256sums=(2b5b1bcef9759cd3202322753cbacd936b36aed03016e52387df32e1aa23330a)

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m build --wheel
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
