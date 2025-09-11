# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-driver
pkgname="python-${_name}"
pkgver=0.2.9
pkgrel=1
pkgdesc='ClickHouse Python Driver with native (TCP) interface support'
arch=('any')
url="https://github.com/mymarilyn/clickhouse-driver"
makedepends=('python-setuptools')
depends=('python' 'python-tzlocal' 'python-pytz')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(
  425d5e5d7a2a2f8721c43b27bed0a4f14cf48eabd6a4dba0f99f18c6ee811607
)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

