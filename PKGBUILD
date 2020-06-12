# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-no-title-bar
_gitname=no-title-bar
pkgver=9
pkgrel=1
pkgdesc='Removes the title bar, moves the window title and buttons to the top panel'
arch=('any')
url="https://github.com/franglais125/$_gitname"
license=('GPL2')
depends=('gnome-shell' 'xorg-xprop')
conflicts=('gnome-shell-extension-pixel-saver' 'gnome-shell-extension-pixel-saver-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0315efce450e2ac22aa9dd36e134d2d2a9a51acf6e870b7679bf9092c9742dc9')

package() {
  _extid="no-title-bar@franglais125.gmail.com"
  cd "$_gitname-$pkgver"
  make _build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -af _build "$pkgdir/usr/share/gnome-shell/extensions/$_extid"
}
