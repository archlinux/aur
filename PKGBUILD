# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite-git
pkgver=308.6ffe18a
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
source=("$pkgname::git+https://github.com/hardpixel/unite-shell")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"

  cd "$srcdir/$pkgname"
  cp -af "unite@hardpixel.eu" "$pkgdir/usr/share/gnome-shell/extensions/"
}
