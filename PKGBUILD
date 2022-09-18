# Maintainer: Francois Menning <f.menning@pm.me>
# Contributer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-status-area-horizontal-spacing
pkgver=2.8
pkgrel=1
pkgdesc="Reduces the horizontal spacing between icons/indicators in the status area"
arch=('any')
url="https://gitlab.com/p91paul/status-area-horizontal-spacing-gnome-shell-extension.git"
license=('custom')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}#tag=v2.8")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  make all
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "status-area-horizontal-spacing@mathematical.coffee.gmail.com" "${pkgdir}/usr/share/gnome-shell/extensions"
}
