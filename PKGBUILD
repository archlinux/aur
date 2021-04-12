# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
pkgver=37
pkgrel=2
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-clipboard-indicator-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("83f865b3d71a333593c339c296e064b4")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/$pkgname-$pkgver/." "$_/clipboard-indicator@tudmotu.com"

  # Remove this line whe gnome 40 compatible version is released
  sed -i 's/"3.38"/"3.38", "40"/g' "$pkgdir/usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com/metadata.json"
}
