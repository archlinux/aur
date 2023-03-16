# Inspired by existing AUR package librewolf-firefox-shim
# Maintainer:  Marko Korhonen <aur@marko.korhonen.cc>
pkgname=cachy-browser-firefox-shim
pkgver=110.0.1
pkgrel=1
pkgdesc="A symlink for using Cachy Browser as Firefox"
arch=('any')
url="https://github.com/CachyOS/CachyOS-Browser-Settings"
license=('MIT')
depends=('cachy-browser')
provides=(
  "firefox=${pkgver}"
)
conflicts=(
  "firefox"
)

pkgver() {
    pacman -Qi cachy-browser | grep -E '^Version[[:space:]]*:' | head -n 1 | awk -F ':' '{print $2}' | sed -E 's|-.*||' | tr -d '[[:space:]]'
}

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/cachy-browser "$pkgdir"/usr/bin/firefox
}
