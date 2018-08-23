# Maintainer: Felix Buehler <account@buehler.de>

pkgname=("python-pykwalify")
_pkgname=pykwalify
pkgver=1.6.1
pkgrel=1
pkgdesc='Python lib/cli for JSON/YAML schema validation'
arch=('any')
url='https://github.com/Grokzen/pykwalify'
license=('MIT')
depends=('python' 'python-dateutil' 'python-docopt' 'python-yaml')
makedepends=('python-dateutil' 'python-docopt' 'python-yaml')
checkdepends=('python-pytest' 'python-testfixtures')
source=("https://github.com/Grokzen/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=('pykwalify')
sha256sums=('0aa89759a0dc2ea200d36a6b550924c4a5b3a83011b8bf03641f8a62f5eb4bbb')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py -q install --root="$pkgdir" --optimize=1 --skip-build
}
