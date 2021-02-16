# Maintainer: SZanko szanko at protonmail dot com

_pkgname=data-science-types
pkgname=python-${_pkgname}
pkgver=0.2.23
pkgrel=2
pkgdesc="Mypy type stubs for numpy, pandas and matplotlib"
arch=('any')
url="https://github.com/predictive-analytics-lab/data-science-types"
license=('Apache')
depends=('python' 'mypy')
optdepends=(
	'python-numpy: for numpy support'
	'python-pandas: for pandas support'
	'python-matplotlib: for matplotlib support'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3778ba8243d546a7b41eecedf69d37f2a4ddd344a3a69198a704ae384dec8cef')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
