# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-driver
pkgname="python-${_name}"
pkgver=0.2.5
pkgrel=1
pkgdesc='ClickHouse Python Driver with native (TCP) interface support'
arch=('any')
url="https://github.com/mymarilyn/clickhouse-driver"
makedepends=('python-setuptools')
depends=('python' 'python-tzlocal' 'python-pytz')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(b942fe972c1f9063e7a80666b405d7ed41e9c45e8ba522cb26c7d5504223cc47)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

