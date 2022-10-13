# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-driver
pkgname="python-${_name}"
pkgver=0.2.4
pkgrel=1
pkgdesc='ClickHouse Python Driver with native (TCP) interface support'
arch=('any')
url="https://github.com/mymarilyn/clickhouse-driver"
makedepends=('python-setuptools')
depends=('python' 'python-tzlocal' 'python-pytz')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(bfc70889bbd95d2f80ba94887880eceb5c909d277edfa9a4986ed54b76ec6ff4)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

