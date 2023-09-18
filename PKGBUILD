# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-connect
pkgname="python-${_name}"
pkgver=0.6.12
pkgrel=1
pkgdesc='ClickHouse Connect is a suite of Python packages providing interoperability with a wide range of Python applications'
arch=('any')
url='https://github.com/ClickHouse/clickhouse-connect'
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pytz')
license=('Apache')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(03e8c3c51e4e964c460ba533b9b9e1ee41e4ce030692419b662d3f8e179d7165)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
