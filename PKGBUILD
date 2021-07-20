# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-intensity-normalization
_pkgname=intensity-normalization
pkgver=1.4.5
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
sha512sums=('2cacaeaad0912f0a9cdab35d319542723430503f642d4e4fcabef9156e7d1a200817b3c693bc755fd7d4ac025a65a982756a969e4576c3c96d3f40db890757a2')

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

