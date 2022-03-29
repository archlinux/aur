# Maintainer: Mario Oenning <mo-son at mailbox dot org>

_pkgname=pacseek
pkgname=pacseek-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages (binary version)'
arch=('x86_64')
url="https://github.com/moson-mo/$_pkgname"
license=('GPL2')
depends=('pacman')
provides=('pacseek')
conflicts=('pacseek')
source=("$url/releases/download/v$pkgver/$_pkgname-linux-x64-v$pkgver.tar.gz"
		"https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/LICENSE"
		"https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/assets/$_pkgname.desktop"
		"https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/assets/$_pkgname.png")
sha256sums=('1e79f762fdb6a3606c8f403bf05aa2e70ac1f97dec10811ffbafde581ff7a9c9'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'f0ac9fc9cd0ff0f601dbc21f64ca11d24a68ea157d32904caecc5d0214c9bc5b'
            '270ac93d5a7e92f8990c48857d772e800ac59cb9a877be8d9c296e6dd42c59e6')

package() {
  # bin
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # .desktop
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$_pkgname.desktop"
  
  # icon
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
