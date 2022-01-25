# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-intensity-normalization
_pkgname=intensity-normalization
pkgver=2.1.4
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
sha512sums=('0155bc97312d4dfe61b55378b1e91aec20b14da61e1d9fc63ce95206869cff53cf191d1673d7a7c8ea5fe1471e3dc7e23d2fb0a4ddf0d1729fd51e6b65dd34bb')

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

