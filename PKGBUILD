# Maintainer: Munzir Taha <munzirtaha@gmail.com>
# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.12.1
pkgrel=1
pkgdesc="A unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL-2.0-only')
depends=('python' 'python-pexpect' 'python-yaml' 'python-magic' 'python-packaging' 'python-boto3' 'python-simplejson' 'python-requests' 'python-setuptools' 'python-selinux')
optdepends=('usbutils')
makedepends=('python-sphinx' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-coverage' 'python-pycodestyle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sosreport/sos/archive/${pkgver}.tar.gz")
sha256sums=('834c08588fbaaf3a311baec30037778f53d3a45aea00862083ba3eddbf4e202b')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
