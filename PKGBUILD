# Maintainer: Munzir Taha <munzirtaha@gmail.com>
# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.8.0
pkgrel=1
pkgdesc="A unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL-2.0-only')
depends=('python' 'python-pexpect' 'python-yaml' 'python-magic' 'python-packaging' 'python-boto3' 'python-simplejson' 'python-requests' 'python-setuptools' 'python-selinux')
optdepends=('usbutils')
makedepends=('python-sphinx')
checkdepends=('python-coverage' 'python-pycodestyle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sosreport/sos/archive/${pkgver}.tar.gz")
sha256sums=('3ce5492d84e3d9350c65b2f85029d2a5a35058fe3f665e52013e1a79d87ff258')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
