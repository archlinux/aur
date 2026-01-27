# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=2.4.0
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL-3.0-or-later')

depends=('python'
         'python-cloudpickle'
         'python-dask>=2023.2.1'
         'python-importlib-metadata>=3.6'
         'python-jinja'
         'python-matplotlib>=3.6'
         'python-natsort'
         'python-numpy>=1.22.0'
         'python-packaging'
         'python-pint>=0.10'
         'python-prettytable>=2.3'
         'python-yaml'
         'python-rosettasciio'
         'python-scipy>=1.8.0'
         'python-sympy>=1.10'
         'python-tqdm>=4.59.0'
         'python-traits>=6.4.0'
         )

optdepends=('python-numba>=0.56: speed'
            'python-numexpr>=2.8: speed'
            'python-dask-image: dask-image' # AUR
            'ipython: ipython>8.0'
            'python-ipyparallel: ipython'
            'python-scikit-learn>=1.6.0: machine learning features'
            'python-scikit-image>=0.19: image processing features'
            'python-hyperspy-gui-ipywidgets>=2.1.0: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui>=2.1.0: GUI components for desktop' # AUR     
            'python-ipympl: GUI components for Jupyter'
             )

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
             )

checkdepends=('python-pooch'
              'python-pytest>=3.6'
              'python-pytest-cov'
              'python-pytest-mpl'
              'python-pytest-rerunfailures'
              'python-pytest-xdist'
              'python-setuptools-scm'
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

sha256sums=('966e91acf25f8294a9663398b4fd397591723ceb15c2420b9d7ef8b0ae86fb1b')
