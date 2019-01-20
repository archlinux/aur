# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('25f51874c7a56e92901fc4f501d6e9ffffb88cbae36cdf19fd7aa8ecbdfd520e')

build() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
