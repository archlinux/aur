# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=wasabi
pkgname=python-${_pkgname}
pkgver=0.9.1
pkgrel=1
pkgdesc='Lightweight console printing and formatting toolkit'
arch=(any)
url='https://pypi.org/project/wasabi/'
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e3a8e230501575bf0c507adc8c6a014b3630005fbb2347695038b79c86b677338d8ad8f075be29618eff3b0900e9fdaf6fd06a54187272e1a49384ed13b66ece')

build() {
	cd "wasabi-${pkgver}"
	python setup.py build
}

package() {
	cd "wasabi-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
