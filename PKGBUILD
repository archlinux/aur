# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('sgtk-menu')
pkgver=0.0.4
pkgrel=1
pkgdesc="GTK menu for sway and i3"
arch=('x86_64')
url="https://github.com/nwg-piotr/sgtk-menu"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject')
optdepends=('python-i3ipc: to avoid deprecation warnings')

source=("https://github.com/nwg-piotr/sgtk-menu/archive/v$pkgver.tar.gz")

md5sums=('fb7e6d7590c6c81752ac6a8bb30502ec')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/sgtk-menu-arch "$pkgdir"/usr/bin/sgtk-menu
  cd "$srcdir/"$pkgname"-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

