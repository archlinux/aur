# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-fitbit
pkgver=0.3.1
pkgrel=1
pkgdesc="Fitbit API Python client"
arch=('any')
url="https://github.com/orcasgit/${pkgname}"
license=('Apache-2.0')
depends=('python>=3.6' 'python-dateutil' 'python-requests-oauthlib')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://github.com/orcasgit/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('1a9ef9053d0ef5ea85bb36402be5fc1980b5e08e40d2ed81055777f714f197fc2db613977e749278d01d3f487cffe6625a7cc6208b3f0129d7de4baabcbc3644')
b2sums=('2db00f5db3b217f07c7ace367941a1ba8c022ef1a26f86abfc09afd5f00ff97ecc93d4f2a21148529d9c78329fcc15c96c0bdecb9d03ba63638dd104902c0ea7')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

