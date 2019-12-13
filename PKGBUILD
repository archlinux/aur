# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-nibabel
pkgver=2.5.1
pkgrel=2
pkgdesc='Python library for reading and writing of some common neuroimaging file formats'
arch=('any')
url='http://nipy.org/nibabel/index.html'
license=('MIT' 'BSD')
depends=('python' 'python-numpy>=1.8' 'python-six>=1.3')
# building documentation may not work properly, since authors tell to use sphinx <=1.5.6, because "Sphinx >= 1.6 breaks the math_dollar extension"
makedepends=('python-setuptools') 							#('python-sphinx' 'python-numpydoc' 'python-matplotlib>=1.3')
# checkdepends=('python-nose' 'python-mock')
optdepends=('python-scipy: for full SPM-ANALYZE support' 'python-pydicom: (>=0.9.9) for DICOM support'
	'python-pillow: for PNG conversion in DICOMFS' 'python-indexed-gzip')
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/nipy/nibabel/archive/$pkgver.tar.gz")
sha512sums=('49de1a42113e64a56336e02f3143588b574c7b063b10b892ee125048451be701955e505bd1d51183327e2ee221f8364005fdd9fa7d256343113ab6ca1994820d')

build()
{
  	cd "$srcdir/nibabel-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/nibabel-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

