# Maintainer: Dan Johansen <strit@manjaro.org>


pkgname=lifx-onboard-git
pkgver=4.abf83cd
pkgrel=1
pkgdesc='Onboard your LIFX bulbs to your network'
arch=('any')
url="https://github.com/tserong/lifx-hacks"
license=('AGPL3')
depends=('python')
makedepends=('git')
source=("git+https://github.com/tserong/lifx-hacks.git")
md5sums=('SKIP')

pkgver() {
  cd lifx-hacks
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd lifx-hacks
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 onboard.py "${pkgdir}/usr/bin/onboard"
}

