# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite-git
pkgver=46.b3203ca
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/jonian/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
makedepends=("git")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite")
source=("$pkgname::git+https://github.com/jonian/unite-shell")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"

  cd "$srcdir/$pkgname/dist"
  cp -af "unite@hardpixel.eu" "$pkgdir/usr/share/gnome-shell/extensions/"
}
