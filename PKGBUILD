# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-driver
pkgname="python-${_name}"
pkgver=0.2.8
pkgrel=1
pkgdesc='ClickHouse Python Driver with native (TCP) interface support'
arch=('any')
url="https://github.com/mymarilyn/clickhouse-driver"
makedepends=('python-setuptools')
depends=('python' 'python-tzlocal' 'python-pytz')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(01cd7a8ded50e536636a2f24c688d697e78a3551dad30dbe42ac16a4c594798f)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

