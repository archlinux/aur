# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=2.0
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL3')

depends=('python'
         'python-cloudpickle'
         'python-dask>2.11.0'
         'python-importlib-metadata>=3.6'
         'python-jinja'
         'python-matplotlib>=3.1.3'
         'python-natsort'
         'python-numpy>=1.19.0'
         'python-packaging'
         'python-pint>=0.10'
         'python-pooch' 	 
         'python-prettytable>=2.3'
         'python-dateutil>=2.5.0'
         'python-pyaml'
         'python-requests'
         'python-rosettasciio'
         'python-scipy>=1.4.0'
         'python-sympy'
         'python-tqdm>=4.9.0'
         'python-traits>=4.5.0'
         'python-scikit-image>=0.15'  # AUR
         )

optdepends=('python-numba: speed'  # AUR
            'python-numexpr: speed'
            'ipython: ipython'
            'python-ipyparallel: ipython' # AUR, 
            'python-scikit-learn>=1.0.1: machine learning features'
            'python-hyperspy-gui-ipywidgets: GUI components for Jupyter' # AUR
            'python-ipympl: GUI components for Jupyter'
            'python-hyperspy-gui-traitsui: GUI components for desktop'  # AUR
            'python-matplotlib-scalebar: scalebar in images'
            'python-numpydoc: build documentation'
            'python-pydata-sphinx-theme: build documentation'
            'python-setuptools-scm: build documentation'            
            'python-sphinx-copybutton: build documentation'
            'python-sphinx_design: build documentation'
            'python-sphinx-favicon: build documentation'
            'python-sphinx-gallery: build documentation'
            'python-sphinx>=1.7: build documentation'
            'python-sphinxcontrib-mermaid: build documentation'
            'python-sphinxcontrib-towncrier: build documentation'
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

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('d25ec44e2fec425a72debedc7158838e')
