# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=2.2.0
pkgrel=2
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python'
         'python-cloudpickle'
         'python-dask>=2021.5.1'
         'python-importlib-metadata>=3.6'
         'python-jinja'
         'python-matplotlib>=3.6'
         'python-natsort'
         'python-numpy>=1.20.0'
         'python-packaging'
         'python-pint>=0.10'
         'python-pooch' 	 
         'python-prettytable>=2.3'
         'python-dateutil>=2.5.0'
         'python-pyaml'
         'python-requests'
         'python-rosettasciio'
         'python-scipy>=1.6.0'
         'python-sympy>=1.6'
         'python-tqdm>=4.9.0'
         'python-traits>=4.9.0'
         'python-scikit-image>=0.18'  # AUR
         )

optdepends=('python-numba: speed'  # AUR
            'python-numexpr: speed'
            'ipython: ipython'
            'python-ipyparallel: ipython' # AUR, 
            'python-scikit-learn>=1.0.1: machine learning features'
            'python-hyperspy-gui-ipywidgets: GUI components for Jupyter' # AUR
            'python-ipympl: GUI components for Jupyter'
            'python-hyperspy-gui-traitsui: GUI components for desktop'  # AUR
             )

makedepends=('python-setuptools'
             'python-setuptools-scm'
             )

checkdepends=('python-pytest-mpl'
              'python-pytest-rerunfailures'
              'python-pytest-xdist'
              'python-pytest>=3.6'
              'python-setuptools-scm'
              'python-pytest-cov'
               )

replaces=('hyperspy')
conflicts=('hyperspy')
provides=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('cb3c92ceb0edd8d366099fda4c8f3560')
