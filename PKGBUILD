# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=2.0.3
pkgrel=1
pkgdesc="ipywidgets (jupyter) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPLv3')

depends=('python-hyperspy>=2.0'
         'python-ipywidgets>=7.0'
         'python-link-traits'
         'python-ipympl'
         )

#optdepends=()

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             )

replaces=('hyperspy-gui-ipywidgets')
conflicts=('hyperspy-gui-ipywidgets')
provides=('hyperspy-gui-ipywidgets')

source=(https://github.com/hyperspy/hyperspy_gui_ipywidgets/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkginst-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('819c49760b55b63bcb2008cf4672d515')
