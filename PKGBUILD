# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.2.2
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('34f1756cefaba65e32189860ab737e60f196dd80cb50d3f56d21d0e22d1bbe27')

build() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
