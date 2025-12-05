# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-rosettasciio
pkgshort=rosettasciio
pkgver=0.11.0
pkgrel=1
pkgdesc="Rosetta Scientific Input Output library"
arch=('any')
url="http://hyperspy.org/rosettasciio"
license=('GPL-3.0-or-later')

depends=('python'
         'python-dask>=2022.9.2'
         'python-dateutil'
	 'python-h5py>=3.7'
	 'python-imageio>=2.16'
	 'python-numba>=0.56'
         'python-numpy>=1.22.0'
         'python-pint>=0.8'
         'python-box>7.3.1'
         'python-yaml'
         )

optdepends=(
         'python-matplotlib>=3.6: scalebar in images'
         'python-matplotlib-scalebar: scalebar in images'
         'python-scikit-image>=0.20: blockfile'
         'python-sparse: eds-stream'
         'python-tifffile>=2022.7.28: tiff'
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

md5sums=('64aee105deee8d5e55091c12223c1990')
