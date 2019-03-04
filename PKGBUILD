# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-wallpapers-git
pkgver=r102.d45586c
pkgrel=1
pkgdesc='Collection of wallpapers for elementary OS'
arch=(any)
url=https://github.com/elementary/wallpapers
license=(GPL3)
groups=(pantheon-unstable)
makedepends=(git)
provides=(elementary-wallpapers)
conflicts=(elementary-wallpapers)
source=(elementary-wallpapers::git+https://github.com/elementary/wallpapers.git)
sha256sums=(SKIP)

pkgver() {
  cd elementary-wallpapers

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd elementary-wallpapers

  install -dm 755 "${pkgdir}"/usr/share/backgrounds/elementary
  install -m 644 *.jpg "${pkgdir}"/usr/share/backgrounds/elementary/
  ln -s 'elementary/Ashim DSilva.jpg' "${pkgdir}"/usr/share/backgrounds/elementaryos-default
}

# vim: ts=2 sw=2 et:
