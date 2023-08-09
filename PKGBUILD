# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

_name='chompjs'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=1.2.2
pkgrel=1
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
	"${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6d/24/416585e84ad426432d1b9eacb49cc70dd4a9ead2ee14c42619ae95d3b745/${_name}-${pkgver}.tar.gz"
)
provides=("${_framework}-${_name}")
b2sums=('35e36cabadc407aebec4eb99b7f2c62fa52e75604a3c9e3b66f4b1ec0ad4a46edf14baf2c92bb7bdd5744629fc49918468b27d9e4310db5549c2b5900f08c567')

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

