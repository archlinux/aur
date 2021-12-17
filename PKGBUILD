# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-intensity-normalization
_pkgname=intensity-normalization
pkgver=2.1.1
pkgrel=1
pkgdesc='normalize the intensities of various MR image modalities'
arch=('any')
url='https://github.com/jcreinhold/intensity-normalization'
license=('Apache')
depends=('python' 'python-matplotlib' 'python-nibabel' 'python-numpy' 'python-scikit-image' 'python-scikit-fuzzy' 'python-scikit-learn' 'python-scipy' 'python-statsmodels' 'python-webcolors')
# building documentation may not work properly, since authors tell to use sphinx <=1.5.6, because "Sphinx >= 1.6 breaks the math_dollar extension"
makedepends=('python-setuptools')
# checkdepends=('python-nose' 'python-mock')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jcreinhold/${_pkgname}//archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c3380db31732ad14218d6474b92bb40e7c14315de0b3cc17b8d0cd15bc23155ed05debef65b5aa003c93b7803abb027b9e38ab5241e4f764cfaef8fe7513e96e')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

