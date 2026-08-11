# Maintainer: Josh Ellithorpe <quest@mac.com>
pkgname=papirus-xapp-symbolic-icons-git
pkgver=r10.abc7f3e
pkgrel=1
pkgdesc="Papirus-styled versions of the xapp symbolic icons (XSI) used by Linux Mint, Cinnamon, and XApps"
arch=('any')
url="https://github.com/zquestz/papirus-xapp-symbolic-icons"
license=('GPL-3.0-only')
depends=('papirus-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  mkdir -p "$pkgdir/usr/share/icons/Papirus"
  cp -r icons/Papirus/. "$pkgdir/usr/share/icons/Papirus/"
}
