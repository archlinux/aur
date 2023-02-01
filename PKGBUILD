# Maintainer: Nico Wellpott <nico@planet-express.org>

_name=nbxmpp-client
pkgname="python-nbxmpp-client"
pkgrel=1
pkgver=2.0.0
pkgdesc="A small GTK test client to test various ways to connect to a server."
arch=("any")
url="https://dev.gajim.org/gajim/$_name"
license=('MIT')
makedepends=('git' 'python' 'python-setuptools')
depends=('python' 'python-nbxmpp' 'gtksourceview5' 'python-gobject' 'gobject-introspection' "gtk4" "libadwaita")
provides=('nbc')
source=("https://dev.gajim.org/gajim/$_name/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('9c432c5a56935d0cf8eaa2da81ce62ef2d6654a54085bdccf14ace0b26ec4ad1')

build() {
  cd $srcdir/$_name-v$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_name-v$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
