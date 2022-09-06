# Maintainer: Mario Oenning <mo-son at mailbox dot org>

_pkgname=pacseek
pkgname=pacseek-bin
pkgver=1.6.6
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages (binary version)'
arch=('x86_64')
url="https://github.com/moson-mo/$_pkgname"
license=('MIT')
depends=('pacman')
optdepends=('xdg-utils: open URL on click support'
            'fakeroot: display upgrades support')
provides=('pacseek')
conflicts=('pacseek')
source=("$url/releases/download/v$pkgver/$_pkgname-linux-x64-v$pkgver.tar.gz")
sha256sums=('bb3d74802996a3c51ebd0405e8baf287b52871f9050ce2254bf89441baa80758')

package() {
  # bin
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # .desktop
  install -Dm644 "assets/$_pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$_pkgname.desktop"
  
  # icon
  install -Dm644 "assets/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
