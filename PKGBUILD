# Maintainer: prettyletto <prettyletto@users.noreply.github.com>
pkgname=omarchy-theme-marketplace-git
pkgver=0.r0.g97ca8b7
pkgrel=1
pkgdesc="Walker and Elephant theme marketplace for Omarchy"
arch=("any")
url="https://github.com/prettyletto/omarchy-theme-marketplace"
license=("MIT")
depends=("bash" "curl" "elephant" "imagemagick" "libnotify" "uwsm" "walker" "xdg-terminal-exec")
makedepends=("git")
optdepends=("omarchy: required for theme installation and Omarchy command integration")
provides=("omarchy-theme-marketplace")
conflicts=("omarchy-theme-marketplace")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/omarchy-theme-marketplace"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/omarchy-theme-marketplace"

  install -Dm755 bin/omarchy-theme-marketplace "$pkgdir/usr/bin/omarchy-theme-marketplace"
  install -Dm755 bin/omarchy-theme-marketplace-refresh "$pkgdir/usr/bin/omarchy-theme-marketplace-refresh"
  install -Dm755 bin/omarchy-theme-marketplace-install "$pkgdir/usr/bin/omarchy-theme-marketplace-install"
  install -Dm755 bin/omarchy-theme-marketplace-setup "$pkgdir/usr/bin/omarchy-theme-marketplace-setup"

  install -Dm644 default/elephant/omarchy_theme_marketplace.lua \
    "$pkgdir/usr/share/omarchy-theme-marketplace/elephant/omarchy_theme_marketplace.lua"
  install -Dm644 README.md "$pkgdir/usr/share/doc/omarchy-theme-marketplace/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/omarchy-theme-marketplace/LICENSE"
}
