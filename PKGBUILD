# Maintainer: Felix Buehler <account@buehler.de>

pkgname=("python-pykwalify")
_pkgname=pykwalify
pkgver=1.7.0
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
sha256sums=('7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2')

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
