# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.1.1
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2d76adcd1e67419474f28139d2d444da0e2d4572a2ea266e18981065e8228067')

build() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
