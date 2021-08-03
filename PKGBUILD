# Maintainer: Thayne McCombs <astrothayne at gmail dot com>

pkgname=xdgterm
pkgver=0.0.2
pkgrel=1
pkgdesc="Launch user's preferred terminal"
arch=('any')
url=https://gitlab.com/thayne/xdgterm
license=('LGPL3')
depends=(python python-gobject glib2)
optdepends=('dbus-term-launcher: implementation of org.freedesktop.Terminal1')
makedepends=(python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/x/xdgterm/xdgterm-$pkgver.tar.gz")
sha256sums=('2c918ff923eaebef67c148fdf85221f8bc28d4fb1ae7c608091f2fd18ce00b79')

build() {
  cd "xdgterm-$pkgver"
  python setup.py build
}

package() {
  cd "xdgterm-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
