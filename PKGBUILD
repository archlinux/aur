# Maintainer: Benoît Taine <ork@olol.eu>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pypi_module=pgi
pkgname=python-${_pypi_module}-git
pkgver=0.0.11.2.r12.gdf95a40
pkgrel=1
pkgdesc="Pure Python GObject Introspection Bindings. Needed for gi with pypy"
arch=(any)
url="https://pypi.python.org/pypi/pgi"
license=('GPL')
groups=()
depends=('python' 'python-gobject')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/pygobject/pgi.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pypi_module"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/$_pypi_module"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
