# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-exspy
pkgshort=exspy
pkgver=0.1
pkgrel=2
pkgdesc="Analysis of EDS and EELS data with HyperSpy"
arch=('any')
url="http://hyperspy.org/exspy"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-hyperspy>=2.0rc0'
         'python-matplotlib'
         'python-numexpr'
         'python-numpy'
         'python-pint'
         'python-pooch'
         'python-prettytable'
         'python-requests'
         'python-scipy'
         'python-traits'
         )

optdepends=('python-hyperspy-gui-ipywidgets>=2.0: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui>=2.0: GUI components for desktop'  # AUR
            'python-matplotlib-scalebar: scalebar in images'
            'python-numpydoc: build documentation'
            'python-pydata-sphinx-theme: build documentation'
            'python-sphinx-copybutton: build documentation'
            'python-sphinx_design: build documentation'
            'python-sphinx-favicon: build documentation'
            'python-sphinx-gallery: build documentation'
            'python-sphinx>=1.7: build documentation'
            'python-sphinxcontrib-mermaid: build documentation'
            'python-towncrier'
             )


makedepends=('python-setuptools'
             'python-setuptools-scm')

provides=('exspy')

source=(https://github.com/hyperspy/$pkgshort/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('78e25251ee2ef6a18eda548887fe9c7c')
