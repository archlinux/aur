# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.9.0
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL3')

depends=('python'
	 'python-dask>=2021.8.1'
	 'python-diffpy.structure>=3'
         'python-diffsims>=0.5.1'
         'python-hyperspy>=1.7.3'
	 'python-h5py-openmpi>=2.10' # openmpi for pyxem/pyfai compatibility
	 'python-imageio'
         'python-matplotlib>=3.5'
	 'python-numpy>=1.21.6'
	 'python-numba>=0.55'
	 'python-orix>=0.11.1'
	 'python-pooch>=0.13'
         'python-pyyaml'
	 'python-tqdm>=0.5.2'
         'python-scikit-image>=0.16.2'
         'python-scikit-learn'
         'python-scipy>=1.7'
         )

makedepends=('python-setuptools' )

optdepends=('python-pyvista: visualization',
            'python-pyebsdindex>=2: orientation indexing')

provides=('kikuchipy')

source=(https://github.com/pyxem/kikuchipy/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


md5sums=('21aba3acaeefddd8e16c4c1a082033d2')
