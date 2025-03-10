# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.11.2
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL-3.0-or-later')

depends=('python'
	 'python-dask>=2021.8.1'
	 'python-diffpy.structure>=3'
         'python-diffsims>=0.5.2'
         'python-hyperspy>=2.2'
	 'python-h5py>=2.10'
	 'python-imageio'
         'python-lazy-loader'
         'python-matplotlib>=3.5'
         'python-numba>=0.57'
	 'python-numpy>=1.23.0'
	 'python-orix>=0.12.1'
	 'python-pooch>=1.3.0'
         'python-pyyaml'
         'python-rosettasciio>=0.3.0'
         'python-scikit-image>=0.16.2'
         'python-scikit-learn'
         'python-scipy>=1.7'
         'python-tqdm>=0.5.2'
         )

makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             )

optdepends=('python-pyvista: visualization',
            'python-pyebsdindex>=0.3.2: orientation indexing')

provides=('kikuchipy')

source=(https://github.com/pyxem/kikuchipy/archive/v$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

md5sums=('f9c5128870d0ec9867fbbfc5ea993905')
