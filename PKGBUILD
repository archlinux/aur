# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_name='chompjs'
_framework='python'
pkgname="${_framework}-${_name}"
pkgver=1.2.4
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
	"${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/2a/7a/a8c24d8822edf1143aa1f5febd0c445ccd594183949d47ee925908f27bab/${_name}-${pkgver}.tar.gz"
)
provides=("${_framework}-${_name}")
b2sums=('66c04675d251989dc59f5355a3e64961c2f70163c7ec63610fe8ee09cd2ffba348c3d9e2a276ea5178ed00f732bcd8d77d1318a0002eabec9cca069ba1ac2117')

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

