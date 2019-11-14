# Maintainer: BrainDamage
pkgname="python-wfdb"
_dirname='wfdb-python'
pkgver=2.2.0
pkgrel=2
pkgdesc="A library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-nose" "python-pandas" "python-requests" "python-scikit-learn")
sha256sums=('d93fdad3950edfb6edd3724c5e5019ca351f81fa599f98f54a43051f41888cc8')
source=("https://github.com/MIT-LCP/${_dirname}/archive/${pkgver}.tar.gz")


build() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_dirname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
}

