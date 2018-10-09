# Maintainer: Michaël Defferrard <m.deff@hotmail.com>

pkgname=python-pygsp
pkgver=0.5.1
pkgrel=1
pkgdesc="Graph Signal Processing in Python"
arch=('any')
url="https://github.com/epfl-lts2/pygsp"
license=('MIT')
optdepends=('python-matplotlib: plot graphs, signals, and filters'
            'python-pyqtgraph: interactive graph visualization'
            'python-opengl: interactive graph visualization in 3d'
            'python-scikit-image: construct patch graphs from images')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pygsp/PyGSP-${pkgver}.tar.gz")
sha256sums=('4874ad88793d622d4f578b40c6617a99b1f02bc6c6c4077f0e48cd71c7275800')

package() {
	depends=('python-numpy' 'python-scipy')
	cd "PyGSP-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
