# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
_pkgname=networkmanager-dmenu
_gitname=networkmanager-dmenu
pkgname=$_pkgname-git
pkgver=r143.c98810b
pkgrel=1
pkgdesc="Control NetworkManager via dmenu"
arch=('any')
url="https://github.com/firecat53/networkmanager-dmenu"
license=('MIT')
depends=('python' 'networkmanager' 'python-gobject')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'network-manager-applet: for the nm-connection-editor GUI'
            'libnotify: any notification platform (dunst, for example)')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/firecat53/$_gitname.git")
md5sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/networkmanager_dmenu" "$pkgdir/usr/bin/networkmanager_dmenu"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname/config.ini.example" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
  install -Dm644 "$srcdir/$_pkgname/networkmanager_dmenu.desktop" "$pkgdir/usr/share/applications/networkmanager_dmenu.desktop"
}

# vim:set ts=2 sw=2 et:
