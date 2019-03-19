# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=i3-battery-popup-git
pkgver=r23.5855624
pkgrel=1
pkgdesc="A script that shows messages to the user when the battery is almost empty."
arch=(any)
url="https://github.com/rjekker/i3-battery-popup"
license=('GPL')
provides=('i3-battery-popup')
conflicts=('i3-battery-popup')
optdepends=('tk')
makedepends=('git')
source=(
"$pkgname::git+https://github.com/rjekker/i3-battery-popup.git#branch=master"
)
md5sums=(
"SKIP"
)
package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgname/i3-battery-popup" "$pkgdir/usr/bin/i3-battery-popup"
}
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

