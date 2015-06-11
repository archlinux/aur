# Maintainer: Scott Hansen (firecat53) firecat4153 at gmail dot com
_pkgname=networkmanager-dmenu
_gitname=nmcli-dmenu
pkgname=$_pkgname-git
pkgver=r9.0a6fa27
pkgrel=4
pkgdesc="Control NetworkManager via dmenu"
arch=('any')
url="https://github.com/firecat53/nmcli-dmenu"
license=('MIT')
depends=('python' 'networkmanager')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'network-manager-applet: for the nm-connection-editor GUI')
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
  install -Dm755 "$srcdir/$_pkgname/nmcli_dmenu" "$pkgdir/usr/bin/nmcli_dmenu"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/license/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.rst" "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 "$srcdir/$_pkgname/config.ini.example" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
  install -Dm644 "$srcdir/$_pkgname/nmcli_dmenu.desktop" "$pkgdir/usr/share/applications/nmcli_dmenu.desktop"
}

# vim:set ts=2 sw=2 et:
