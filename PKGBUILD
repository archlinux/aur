# Maintainer: Mario Oenning <mo-son at mailbox dot org>

_pkgname=pacseek
pkgname=pacseek-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages (binary version)'
arch=('x86_64')
url="https://github.com/moson-mo/$_pkgname"
license=('GPL2')
depends=('pacman')
provides=('pacseek')
conflicts=('pacseek')
source=("$url/releases/download/v$pkgver/$_pkgname-linux-x64-v$pkgver.tar.gz"
		"https://raw.githubusercontent.com/moson-mo/$_pkgname/main/LICENSE"
		"https://raw.githubusercontent.com/moson-mo/$_pkgname/main/assets/$_pkgname.desktop")
sha256sums=('1ca1f8d9498655c61077810abda53a3b9c8c401fd714e6a89b5f00dec32c43f7'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '202144575b7e4830982a4cbe569d3eb50b51410d9dfa1c35203e87795a09bf22')

package() {
  # bin
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # .desktop
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$_pkgname.desktop"
}
