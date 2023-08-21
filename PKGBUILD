# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-intensity-normalization
_pkgname=intensity-normalization
pkgver=2.2.4
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
sha512sums=('2dd66f87429fd7f7e53ea93dec63201f146c0e9ee5c34aa8e6773a5ddd2db06bf9eb1e796731f5183225e6ca0760eaadb9cf74bc0e1334f4419db0f16b2acfba')

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

