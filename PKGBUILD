# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=gnome-shell-extension-legacy-theme-auto-switcher-git
_uuid=legacyschemeautoswitcher@joshimukul29.gmail.com
pkgver=r21.e935a51
pkgrel=1
pkgdesc="Change the GTK3 theme to light/dark variant based on the system color scheme"
arch=('any')
url="https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension"
license=('AGPL-3.0-only')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm644 extension.js metadata.json -t "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
}
