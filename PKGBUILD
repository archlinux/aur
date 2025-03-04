# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-ipywidgets
pkginst=hyperspy_gui_ipywidgets
pkgver=2.1.0
pkgrel=1
pkgdesc="ipywidgets (jupyter) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_ipywidgets"
license=('GPL-3.0-or-later')

depends=('python-hyperspy>=2.3.0'
         'python-ipywidgets>=8.0'
         'python-link-traits'
         'python-ipympl' # for convenience
         )

#optdepends=()

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
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
md5sums=('f29d63f410366804e76a5df03c717421')
