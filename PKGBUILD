# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=lifx-onboard-git
pkgver=5.ea3754c
pkgrel=1
pkgdesc='Onboard your LIFX bulbs to your network'
arch=('any')
url="https://github.com/tserong/lifx-hacks"
license=('AGPL-3.0-or-later')
depends=('python')
makedepends=('git')
source=("git+https://github.com/tserong/lifx-hacks.git")
sha256sums=('SKIP')

pkgver() {
  cd lifx-hacks
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd lifx-hacks
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 onboard.py "${pkgdir}/usr/bin/onboard"
}
