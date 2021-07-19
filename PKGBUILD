# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.2.3
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('aa3da48dd779a52e20e26166b99b1c3e56661b9dcfbbd65f0318bdd969210f4ff460e493821e38a04ce9d126cc93677d2537f58cdc60647afb4e66bcfc48bec1')

build() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/daemonocle-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
