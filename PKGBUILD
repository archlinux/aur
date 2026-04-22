# Maintainer: Munzir Taha <munzirtaha@gmail.com>
# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.11.1
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
sha256sums=('57d45185bc358e61931ba485bdc3135b127b75b77b2dc5ee005ab8e8522a568c')

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
