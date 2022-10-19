# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-intensity-normalization
_pkgname=intensity-normalization
pkgver=2.2.3
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
sha512sums=('6a56867efad9fb38a6edb6006d7cf55d7267459e8b3a3541f7e2054d3d1600fa284910932f0d43728a34daaff9a4a20e7f3f32c1bdb29cffa0bd4e8b66d54782')

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

