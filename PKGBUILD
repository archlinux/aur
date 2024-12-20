# Maintainer: Munzir Taha <munzirtaha@gmail.com>
# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.8.2
pkgrel=2
pkgdesc="A unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL-2.0-only')
depends=('python' 'python-pexpect' 'python-yaml' 'python-magic' 'python-packaging' 'python-boto3' 'python-simplejson' 'python-requests' 'python-setuptools' 'python-selinux')
optdepends=('usbutils')
makedepends=('python-sphinx')
checkdepends=('python-coverage' 'python-pycodestyle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sosreport/sos/archive/${pkgver}.tar.gz")
sha256sums=('a3429cac42ed40f39c0882936f6567866a63652965220f80f5daeeda69ad0ff0')

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
