# Maintainer: Thomas Roos <mail [at] thomasroos.nl>
# Co-maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: wedjat <wedjat@protonmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-nibabel
pkgver=3.0.0
pkgrel=1
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
sha512sums=('eec66fd0a2cfcfece37bd11023e40a6806dc1e0fd1f9144a63830ecd1bc49a8491fd308e2f560379017581008cb5a134cb77a9903c09574083a24b95c6a3ff96')

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

