# Maintainer: Siddharth Dushantha <siddharth dot dushantha at gmail dot com>
pkgname=gnome-shell-extension-instant-workspace-switcher-git
pkgver=r21.875e22f
pkgrel=1
pkgdesc="Disable Workspace Switch Animation for GNOME 40+"
arch=(any)
url="https://github.com/amalantony/gnome-shell-extension-instant-workspace-switcher"
license=("GPL-2.0-only")
depends=("gnome-shell")
makedepends=("git")
source=("${pkgname}::git+https://github.com/amalantony/gnome-shell-extension-instant-workspace-switcher.git")
sha256sums=("SKIP")

_uuid=instantworkspaceswitcher@amalantony.net

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r "$_uuid"/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

