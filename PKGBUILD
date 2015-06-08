# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=plymouth-theme-numix-bzr
pkgver=r1
pkgrel=1
pkgdesc='Numix theme for Plymouth'
arch=('any')
url='https://launchpad.net/numix-plymouth'
license=('GPL3')
depends=('plymouth')
makedepends=('bzr')
source=('plymouth-theme-numix::bzr+lp:numix-plymouth')
sha256sums=('SKIP')

pkgver() {
  cd plymouth-theme-numix

  printf "r%s" "$(bzr revno)"
}

package() {
  cd plymouth-theme-numix

  install -dm 755 "${pkgdir}"/usr/share
  cp -dr --no-preserve='ownership' lib/plymouth "${pkgdir}"/usr/share/
}

# vim: ts=2 sw=2 et:
