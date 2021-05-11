# Maintainer: SZanko, szanko at protonmail dot com

_pkgname=radontea
pkgname=python-${_pkgname}
pkgver=0.4.9
pkgrel=1
pkgdesc="Algorithms to compute the inverse Radon transform (e.g. SART, backprojection, Fourier interpolation)."
arch=('any')
url="https://github.com/RI-imaging/radontea"
license=('BSD')
depends=(
	'python'
	'python-setuptools'
	'python-pip'
	'python-numpy'
	'python-scipy'
	)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('bb08e109987ecd95b2c0699b536042314bb495d508fe794aba31146ca067015a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
