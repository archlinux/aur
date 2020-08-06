# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.0.2
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e2c29ed127e0177adf9805fe07a564c7be98ddd095654a5c579f543bcb4bb7cd')

build() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
