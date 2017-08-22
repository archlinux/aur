# Maintainer: Felix Buehler <account@buehler.de>

_pkgname=pykwalify
pkgname=python-pykwalify
pkgver=1.6.0
pkgrel=1
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url='https://github.com/Grokzen/pykwalify'
license=('MIT')
makedepends=('python-dateutil' 'python-docopt' 'python-yaml')
source=("https://github.com/Grokzen/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=('pykwalify')
sha256sums=('97f880ccf5de3b50f85d08226333e4474fcb1ede8d76438e7a6df0831cf0d95d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py -q install --root="$pkgdir" --optimize=1
}