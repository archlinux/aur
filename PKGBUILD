# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_name='chompjs'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=1.3.0
pkgrel=2
pkgdesc='Parsing JavaScript objects into Python data structures'
arch=('any')
url="https://github.com/Nykakin/${_name}"
license=('MIT')
makedepends=(
	'python-setuptools'
)
depends=(
	'python>=3'
)
source=(
	"${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/05/aa/19e20c5157bcb76f22395143d9a26b33e82d5aff37e25f2feef259f13131/chompjs-1.3.0.tar.gz"
)
provides=("${_framework}-${_name}")
b2sums=('a3fdf2a683413e937c1a00aa07b1b9caec2da4ea4913613129259491408b20a0ba8d49e863f0d9e6a3171c188c523c48aa841635a6982ba6de4e1364ce19cd3b')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

