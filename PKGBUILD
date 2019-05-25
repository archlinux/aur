# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=itk
pkgname=python-itk
pkgver=5.0.0
pkgrel=1
pkgdesc="Open-source toolkit for multidimensional image analysis"
arch=('x86_64')
url='https://itk.org/'
license=('Apache')
depends=('python-numpy')
makedepends=(
	'cmake'
	'doxygen'
	'git'
	'python-scikit-build'
	'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('524af5ee66709b59c86cbf0d81df1524ca3b77ffc7d328ceecb97f81938fd9d1')


package() {

	# NOTE
	# Not all image types are wrapped by default.
	# If you need any type that is not included, you should build
	# ITK from sources using the insight-toolkit package, editing
	# the PKGBUILD to enable Python wrapping and adding to the CMake
	# confing any additional component you want to include.

	cd "$srcdir/$_name-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}

