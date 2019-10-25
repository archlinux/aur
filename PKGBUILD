# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-lutron-caseta-pro-git
_pkgname=lutron-caseta-pro
pkgrel=2
pkgver=r42.f7678c8
pkgdesc="Lutron Caseta Pro Component for Home Assistant"
arch=("any")
url="https://github.com/upsert/lutron-caseta-pro"
source=("$_pkgname::git+https://github.com/upsert/$_pkgname.git")
depends=("home-assistant")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/var/lib/hass"
  cp -ra "$srcdir/$_pkgname/custom_components" "$pkgdir/var/lib/hass"
}
