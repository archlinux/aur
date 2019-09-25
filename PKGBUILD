# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-dnsdumpster-api-git
pkgver=0.2.r26.geda15d6
pkgrel=1
pkgdesc="Python API for dnsdumpster.com"
arch=(any)
url="https://github.com/PaulSec/API-dnsdumpster.com"
license=('unknown')
depends=('python' 'python-requests' 'python-beautifulsoup4')
makedepends=('git')
provides=("python-dnsdumpster-api")
conflicts=("python-dnsdumpster-api")
source=('git+https://github.com/PaulSec/API-dnsdumpster.com.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/API-dnsdumpster.com"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/API-dnsdumpster.com"
	python setup.py install --root="${pkgdir}/" --optimize=1
}

