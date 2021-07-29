# Maintainer: Antonin Dach <dach@protonmail.com>
pkgname=librewolf-firefox-shim
pkgver=89.0.2
pkgrel=1
pkgdesc="A symlink for using librewolf as a firefox"
arch=('any')
url="https://librewolf-community.gitlab.io/"
license=('MIT')
depends=('librewolf')
provides=(
  "firefox=${pkgver}"
)
conflicts=(
  "firefox"
)

pkgver() {
  pacman -Qi librewolf | grep -E '^Version[[:space:]]*:' | head -n 1 | awk -F ':' '{print $2}' | sed -E 's|-.*||' | tr -d '[[:space:]]'
}

package() {
  install -d "$pkgdir"/usr/bin
  ln -s /usr/bin/librewolf "$pkgdir"/usr/bin/firefox
}
