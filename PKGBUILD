# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.13.2
pkgrel=1
pkgdesc="Python library for analysing orientations and crystal symmetry."
arch=('any')
url="https://orix.rtfd.io/"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-diffpy.structure>=3.0.2'
	 'python-h5py'
         'python-matplotlib>=3.6.1'
	 'python-matplotlib-scalebar'
         'python-numba'
	 'python-numpy'
	 'python-pooch>=0.13'
         'python-pycifrw'
         'python-scipy'
	 'python-tqdm'
         )

makedepends=('python-setuptools'
             'python-hatchling'
             )

provides=('orix')

source=(https://github.com/pyxem/orix/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('5b4c9c92af72697ec810218ea644f5af')
