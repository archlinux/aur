# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-rosettasciio
pkgshort=rosettasciio
pkgver=0.7.1
pkgrel=1
pkgdesc="Rosetta Scientific Input Output library"
arch=('any')
url="http://hyperspy.org/rosettasciio"
license=('GPL3')

depends=('python'
         'python-dask>=2021.5.1'
         'python-dateutil'
	 'python-h5py>=2.3'
	 'python-imageio>=2.16'
	 'python-numba>=0.53'
         'python-numpy>=1.20.0'
         'python-pint>=0.8'
         'python-box>=6'
         'python-pyaml'
         )

optdepends=(
	 'python-blosc>=1.5: mrcz'
         'python-matplotlib>=3.6: scalebar in images'
         'python-matplotlib-scalebar: scalebar in images'
         'python-scikit-image>=0.18: blockfile'
         'python-sparse: eds-stream'
         'python-tifffile>=2022.7.28: tiff'
         'python-imagecodecs: tiff'
         'python-zarr<3: zspy'
         'python-msgpack: zspy'
         )


makedepends=('python-setuptools' )

provides=('rsciio')

source=(https://files.pythonhosted.org/packages/source/r/$pkgshort/$pkgshort-$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('983f2fb9e8798f90a557579e47cdd7b7')
