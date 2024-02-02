# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

_name='chompjs'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=1.2.3
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
	"${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/1f/58/afbd1a858cb037a6d65a4e9506fe433bd09a4152a5922196744636e67c0d/${_name}-${pkgver}.tar.gz"
)
provides=("${_framework}-${_name}")
b2sums=('4e0b6c484876ab651d560f26acf58340231df65b4c22347175b1f75bbbac6f57d6be4597cd32873e4cd1f2ab0eedae2ebb3d41b381913a24675494c91f608fe7')

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

