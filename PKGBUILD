# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('sgtk-menu')
pkgver=0.8.0
pkgrel=1
pkgdesc="GTK menu for sway, i3 and some floating WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/sgtk-menu"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-cairo' 'python-i3ipc')
optdepends=('python-pynput: for positioning in floating window managers')

source=("https://github.com/nwg-piotr/sgtk-menu/archive/v$pkgver.tar.gz")

md5sums=('d6e62eff784c5eea412f8891f5e7a51c')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/sgtk-menu-arch "$pkgdir"/usr/bin/sgtk-menu
  install -D -m 755 "$pkgname"-"$pkgver"/dist/sgtk-bar-arch "$pkgdir"/usr/bin/sgtk-bar
  cd "$srcdir/"$pkgname"-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

