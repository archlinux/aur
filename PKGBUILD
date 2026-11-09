# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-rosettasciio
pkgshort=rosettasciio
pkgver=0.15.0
pkgrel=1
pkgdesc="Rosetta Scientific Input Output library"
arch=('any')
url="http://hyperspy.org/rosettasciio"
license=('GPL-3.0-or-later')

depends=('python'
         'python-dask>=2024.12.0'
         'python-dateutil'
	 'python-h5py>=3.8.0'
         'python-numpy>=1.25.0'
         'python-pint>=0.8'
         'python-box>7.3.1'
         'python-yaml'
         )

optdepends=(
         'python-imageio>=2.27: images'
         'python-matplotlib>=3.6: scalebar in images'
         'python-matplotlib-scalebar: scalebar in images'
	 'python-numba>=0.58: speed'
	 'python-pillow>=9.2.0: images'
         'python-scikit-image>=0.21.0: blockfile'
         'python-sparse: eds-stream'
         'python-tifffile>2026.2.24: tiff'
         'python-imagecodecs: tiff'
         'python-zarr<3: zspy'
         'python-msgpack: zspy'
         )

makedepends=('python-setuptools' )

checkdepends=('python-filelock'
              'python-pooch'
              'python-pytest>=3.6'
              'python-pytest-cov'
              'python-pytest-rerunfailures'
              'python-pytest-xdist'
             )

provides=('rsciio')

source=(https://files.pythonhosted.org/packages/source/r/$pkgshort/$pkgshort-$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('fcf6e6e3675d766231e6eae59b951d2850e3363fd1c9a23957d8408f2833132f')
