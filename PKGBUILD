# Maintainer: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-nibabel
pkgver=2.4.0
pkgrel=1
pkgdesc='Python library for reading and writing of some common neuroimaging file formats'
arch=('x86_64') #i686 not tested
url='http://nipy.org/nibabel/index.html'
license=('MIT' 'BSD')
depends=('python' 'python-numpy>=1.7.1' 'python-six>=1.3')
# building documentation may not work properly, since authors tell to use sphinx <=1.5.6, because "Sphinx >= 1.6 breaks the math_dollar extension"
makedepends=('python-setuptools') 							#('python-sphinx' 'python-numpydoc' 'python-matplotlib>=1.3')
# checkdepends=('python-nose' 'python-mock')
optdepends=('python-scipy: for full SPM-ANALYZE support' 'python-pydicom: (>=0.9.9) for DICOM support'
	'python-pillow: for PNG conversion in DICOMFS' 'python-indexed-gzip')
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/nipy/nibabel/archive/$pkgver.tar.gz")
md5sums=('de457e9a7ae923182eda950e8f10a904')

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

