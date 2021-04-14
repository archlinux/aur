# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=1.6.2
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python'
         'python-scipy'
         'python-matplotlib'
         'python-numpy'
         'python-traits'
         'python-natsort'
         'python-requests'
         'python-tqdm'
         'python-sympy'
         'python-h5py'
         'python-dateutil'
         'python-dask'
         'python-pint'
         'python-numexpr'
         'python-pyaml'
         'python-prettytable'
         'python-dill'  # AUR
         'python-ipyparallel'  # AUR
         'python-scikit-image'  # AUR
         'python-sparse'  # AUR
       # 'python-imageio'  # AUR (from scikit-image)
       # 'python-pywavelets' # AUR (from scikit-image)
       # 'python-tifffile'  # AUR (from scikit-image)        
       # 'python-numba'  # AUR (from python-sparse)
       # 'python-llvmlite' # AUR (from python-numba)
         'python-llvmlite-bin' # AUR (from python-numba, but require bin package to avoid version mismatches)
         )

optdepends=('python-scikit-learn: machine learning features'
            'python-hyperspy-gui-ipywidgets: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui: GUI components for desktop'  # AUR
	    'python-blosc: mrcz file support'
            'cython: enables acceleration of certain operations (must be installed at package build time)' )

makedepends=('python-setuptools' )

replaces=('hyperspy')
conflicts=('hyperspy')
provides=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.tar.gz)
sha256sums=('07dcee767d9c337cc78abbf4b7ffb7051402f0ef2a5296128aeef5774ab3b044')

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
sha256sums=('9582a24d4c361ffcd87c995e4cb282733d39651e30d1e682999b3bdbccdce2db')
