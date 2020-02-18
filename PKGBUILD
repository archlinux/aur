# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=clickhouse-driver
pkgname="python-${_name}"
pkgver=0.1.2
pkgrel=2
pkgdesc='ClickHouse Python Driver with native (TCP) interface support'
arch=('any')
url="https://github.com/mymarilyn/clickhouse-driver"
makedepends=('python-setuptools')
depends=('python' 'python-tzlocal' 'python-pytz')
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('9920211509a27af0b24086b19005c3419a4cd8255a3bd68621a0f1469e38a5ee')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

