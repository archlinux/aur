# Maintainer: Felix Buehler <account@buehler.de>

pkgname=("python-pykwalify")
_pkgname=pykwalify
pkgver=1.6.0
pkgrel=2
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url='https://github.com/Grokzen/pykwalify'
license=('MIT')
depends=('python' 'python-dateutil' 'python-docopt' 'python-yaml')
makedepends=('python-dateutil' 'python-docopt' 'python-yaml')
checkdepends=('python-pytest' 'python-testfixtures')
source=("https://github.com/Grokzen/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=('pykwalify')
sha256sums=('97f880ccf5de3b50f85d08226333e4474fcb1ede8d76438e7a6df0831cf0d95d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py test
}

package_python-pykwalify() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py -q install --root="$pkgdir" --optimize=1
}
