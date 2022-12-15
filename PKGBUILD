# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-connect
pkgname="python-${_name}"
pkgver=0.4.7
pkgrel=1
pkgdesc='ClickHouse Connect is a suite of Python packages providing interoperability with a wide range of Python applications'
arch=('any')
url='https://github.com/ClickHouse/clickhouse-connect'
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pytz')
license=('Apache')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(98c4285fddd1c9e567c83ba6f4b80b19d50ce2db3953a68e72e51fcda90a957b)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
