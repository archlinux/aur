# Maintainer: Yousef H

# This is a copy-paste from Jaroslav Lichtblau <dragonlord@aur.archlinux.org> package `python-scikit-image`.
# I don't want to be the maintainer, feel free to request maintainership.

pkgbase=python-scikit-plot
pkgname=('python-scikit-plot')
pkgver=0.3.5
pkgrel=1
pkgdesc="An intuitive library to add plotting functionality to scikit-learn objects"
arch=('i686' 'x86_64')
url="https://github.com/reiinakano/scikit-plot"
license=('MIT')
#makedepends=
options=('!emptydirs')
source=(https://files.pythonhosted.org/packages/07/ef/ed1d00f8f269d5927616fc532d01ee33f1922266de32533f3893a408546a/scikit-plot-$pkgver.tar.gz)
sha256sums=('92faa58ce2fdbbf7ff93c1bed564c4b615cb3df479c2e4f74dcda034dbb762a2')

build() {
  # msg "Building Python2"
  # cd "${srcdir}"/scikit-image-py2-$pkgver
  # python2 setup.py build

  msg "Building Python3"
  cd "${srcdir}"/scikit-plot-$pkgver
  python setup.py build
}

package_python-scikit-plot() {
	depends=('python-matplotlib'
	'python-scikit-learn'
	'python-scipy'
	'python-joblib'
	'python-numpy'
	'python-cycler'
	'python-pyparsing'
	'python-dateutil'
	'python-pytz'
	'python-six'
	'python-kiwisolver')

	cd "${srcdir}"/scikit-plot-$pkgver
	python setup.py install --root="${pkgdir}"/ --optimize=1
	install -D LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

}