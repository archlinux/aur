# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('sgtk-menu')
pkgver=0.5.0
pkgrel=2
pkgdesc="GTK menu for sway and i3"
arch=('x86_64')
url="https://github.com/nwg-piotr/sgtk-menu"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'python-cairo' 'python-i3ipc')

source=("https://github.com/nwg-piotr/sgtk-menu/archive/v$pkgver.tar.gz")

md5sums=('dfd900c6395dc330785b7df012b1eeb7')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/sgtk-menu-arch "$pkgdir"/usr/bin/sgtk-menu
  cd "$srcdir/"$pkgname"-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

