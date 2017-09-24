# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-wallpapers-git
pkgver=r78.1977ad5
pkgrel=1
pkgdesc='elementary Wallpapers'
arch=('any')
url='https://github.com/elementary/wallpapers'
license=('GPL3')
groups=('pantheon-unstable')
makedepends=('git')
provides=('elementary-wallpapers')
conflicts=('elementary-wallpapers' 'pantheon-backgrounds')
replaces=('pantheon-backgrounds-bzr')
options=('!emptydirs')
source=('elementary-wallpapers::git+https://github.com/elementary/wallpapers.git')
sha256sums=('SKIP')

pkgver() {
  cd elementary-wallpapers

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd elementary-wallpapers

  install -dm 755 "${pkgdir}"/usr/share/backgrounds/elementary
  install -m 644 *.jpg "${pkgdir}"/usr/share/backgrounds/elementary/
  install -m 644 elementaryos-default "${pkgdir}"/usr/share/backgrounds/
}

# vim: ts=2 sw=2 et:
