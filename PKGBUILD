# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=python-influxdb-git
_pkgname=influxdb-python
pkgver=v5.2.2.r0.g5eda204
pkgrel=1
pkgdesc="Python client for InfluxDB (build from git)"
arch=('any')
url="https://github.com/influxdb/influxdb-python/"
license=('MIT')
depends=('python' 'python-requests>=1.0.3' 'python-dateutil>=2.0.0' 'python-six>=1.9.0' 'python-pytz')
makedepends=('python-setuptools' 'git')
optdepends=('influxdb')
source=("git+https://github.com/influxdata/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/influxdb-python"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
