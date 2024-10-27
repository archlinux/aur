# Maintainer: Munzir Taha <munzirtaha@gmail.com>
# Contributor: chr0mag <phillips.julian AT gmail DOT com>

pkgname=sos
pkgver=4.8.1
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
sha256sums=('3e680a87537ef632ab3327515cf07c6e8b5bc8dad0642d89193cc195d0423622')

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
