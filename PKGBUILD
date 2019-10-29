# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite-git
pkgver=r685.0e16a8e
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/hardpixel/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
optdepends=("gnome-shell-extension-dash-to-dock-git")
makedepends=("git")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/$pkgname/unite@hardpixel.eu" "$_"
}
