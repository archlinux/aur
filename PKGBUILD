# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>

pkgname=gnome-shell-extension-haguichi-indicator-git
_gitname=gse-haguichi-indicator
_uuid=gse-haguichi-indicator@ztefn.github.com
pkgver=r65.f835a6c
pkgrel=1
pkgdesc="Lets you control Haguichi directly from the system status area in GNOME Shell."
arch=(any)
url="https://github.com/ztefn/$_gitname"
license=(GPL-3.0-or-later)
depends=(gnome-shell)
makedepends=(git)
provides=(gnome-shell-extension-haguichi-indicator)
conflicts=(gnome-shell-extension-haguichi-indicator)
source=("git+$url")
sha512sums=(SKIP)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -R "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions"
}
