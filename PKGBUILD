# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-backgrounds-bzr
pkgver=r43
pkgrel=1
pkgdesc='Backgrounds for Pantheon'
arch=('any')
url='https://code.launchpad.net/~elementary-design/elementaryos/elementary-wallpapers'
license=('GPL3')
groups=('pantheon-unstable')
makedepends=('bzr')
provides=('pantheon-backgrounds')
conflicts=('pantheon-backgrounds')
options=('!emptydirs')
source=('pantheon-backgrounds::bzr+lp:~elementary-design/elementaryos/elementary-wallpapers')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-backgrounds

  echo "r$(bzr revno)"
}

package() {
  cd pantheon-backgrounds

  install -dm 755 "${pkgdir}"/usr/share/backgrounds/pantheon
  install -m 644 *.jpg extra/*.jpg "${pkgdir}"/usr/share/backgrounds/pantheon/
  install -m 644 elementaryos-default "${pkgdir}"/usr/share/backgrounds/
}

# vim: ts=2 sw=2 et:
