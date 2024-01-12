# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-connect
pkgname="python-${_name}"
pkgver=0.6.23
pkgrel=1
pkgdesc='ClickHouse Connect is a suite of Python packages providing interoperability with a wide range of Python applications'
arch=('any')
url='https://github.com/ClickHouse/clickhouse-connect'
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pytz')
license=('Apache')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(
  499ea08ccedb7dbbb2babd641a7ed1e94ccdd24ae704e1fdfe48002cb351fd81
  )

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
