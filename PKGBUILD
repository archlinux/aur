# Maintainer: Nico Wellpott <nico@planet-express.org>

_name=nbxmpp-client
pkgname="python-nbxmpp-client"
pkgrel=1
pkgver=2.0.1
pkgdesc="A small GTK test client to test various ways to connect to a server."
arch=("any")
url="https://gitlab.com/gajim/$_name"
license=('MIT')
makedepends=('git' 'python' 'python-setuptools')
depends=('python' 'python-nbxmpp' 'gtksourceview5' 'python-gobject' 'gobject-introspection' "gtk4" "libadwaita")
provides=('nbc')
source=("https://gitlab.com/gajim/$_name/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('c31bef5b4205981c0b3b9f18831a3784769522f62ae0f4986188780ceb9cb09f')

build() {
  cd $srcdir/$_name-v$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_name-v$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
