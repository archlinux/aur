# Maintainer: Nabil Freij <nabil.freij@gmail.com>

pkgname=gnome-shell-extension-workspaces-to-dock
pkgver=r561.4ba99b3
pkgrel=1
pkgdesc="Gnome shell extension, Workspaces to Dock, Transform Gnome Shell's overview workspaces into an intelligent dock."
arch=('any')
url="https://extensions.gnome.org/extension/427/workspaces-to-dock/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
akedepends=('git' 'gnome-common')
source=("git+https://github.com/passingthru67/workspaces-to-dock.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/workspaces-to-dock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/workspaces-to-dock"
  glib-compile-schemas "workspaces-to-dock@passingthru67.gmail.com/schemas/"
}

package() {
  cd "$srcdir/workspaces-to-dock"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "workspaces-to-dock@passingthru67.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions/"
}
