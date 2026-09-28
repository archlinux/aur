# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-orix
pkgshort=orix
pkgver=0.15.0
pkgrel=1
pkgdesc="Python library for analysing orientations and crystal symmetry."
arch=('any')
url="https://orix.rtfd.io/"
license=('GPL-3.0-or-later')

depends=('python'
         'python-dask'
         'python-diffpy.structure>=3.0.2'
	 'python-h5py'
	 'python-lazy-loader'
         'python-matplotlib>=3.6.1'
         'python-numba'
	 'python-numpy'
	 'python-packaging'
	 'python-pooch>=0.13'
         'python-scipy'
	 'python-tqdm'
         )

optdepends=('python-matplotlib-scalebar')

makedepends=('python-setuptools'
             'python-hatchling'
             'python-wheel'
             'python-build'
             'python-installer'
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

sha256sums=('f63e45e96af1f263f3e7fe6b5da6e840c1a0a91f682ab9c4853ee9f5fb72e636')
