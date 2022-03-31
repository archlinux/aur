# Maintainer: Mario Oenning <mo-son at mailbox dot org>

_pkgname=pacseek
pkgname=pacseek-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages (binary version)'
arch=('x86_64')
url="https://github.com/moson-mo/$_pkgname"
license=('GPL2')
depends=('pacman')
provides=('pacseek')
conflicts=('pacseek')
source=("$url/releases/download/v$pkgver/$_pkgname-linux-x64-v$pkgver.tar.gz"
		"LICENSE-$pkgver::https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/LICENSE"
		"$_pkgname.desktop-$pkgver::https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/assets/$_pkgname.desktop"
		"$_pkgname.png-$pkgver::https://raw.githubusercontent.com/moson-mo/$_pkgname/v$pkgver/assets/$_pkgname.png")
sha256sums=('38d1727484a681d150bf988c2aa4ce56367a12af5e82050e00cec76da866295f'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'f0ac9fc9cd0ff0f601dbc21f64ca11d24a68ea157d32904caecc5d0214c9bc5b'
            '270ac93d5a7e92f8990c48857d772e800ac59cb9a877be8d9c296e6dd42c59e6')

package() {
  # bin
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname

  # license
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # .desktop
  install -Dm644 "$_pkgname.desktop-$pkgver" "$pkgdir/usr/share/applications/org.moson.$_pkgname.desktop"
  
  # icon
  install -Dm644 "$_pkgname.png-$pkgver" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
