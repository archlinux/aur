# octave_kernel

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=jupyter-gnuplot_kernel
_pkgname=${pkgname#*-}
pkgver=0.4.1
pkgrel=2
pkgdesc="A Jupyter kernel for GNUplot"
arch=('any')
url='https://github.com/has2k1/gnuplot_kernel'
license=('BSD')
depends=('jupyter-metakernel' 'jupyter-notebook' 'gnuplot')
makedepends=('python-pip')
install=${pkgname}.install
source=("https://github.com/has2k1/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bfc0e72556a32198b589ccfa97ed9575e31e2017f3f60b65a1b6d956bd1a7333')

build() {
	cd "$srcdir"/${_pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

