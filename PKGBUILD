# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('sgtk-menu')
pkgver=0.3.0
pkgrel=2
pkgdesc="GTK menu for sway and i3"
arch=('x86_64')
url="https://github.com/nwg-piotr/sgtk-menu"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-cairo')
optdepends=('python-i3ipc: to avoid deprecation warnings')

source=("https://github.com/nwg-piotr/sgtk-menu/archive/v$pkgver.tar.gz")

md5sums=('258dff15f6f4ec4d48cf241f31b8a192')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/sgtk-menu-arch "$pkgdir"/usr/bin/sgtk-menu
  cd "$srcdir/"$pkgname"-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

