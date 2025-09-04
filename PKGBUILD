# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
#
pkgname=python-hyperspy-gui-traitsui
pkginst=hyperspy_gui_traitsui
pkgver=2.1.1
pkgrel=1
pkgdesc="traitsui (desktop) GUI elements for HyperSpy" 
arch=('any')
url="https://github.com/hyperspy/hyperspy_gui_traitsui"
license=('GPL-3.0-or-later')

depends=('python-hyperspy>=2.3.0'
         'python-traits>=6.3'
         'python-traitsui>=7.3'
         )

#optdepends=()

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
             )

replaces=('hyperspy-gui-traitsui')
conflicts=('hyperspy-gui-traitsui')
provides=('hyperspy-gui-traitsui')

source=(https://github.com/hyperspy/hyperspy_gui_traitsui/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkginst-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkginst-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('0bddd1e84fad7b0aad7dcfcc6f6ceb62')
