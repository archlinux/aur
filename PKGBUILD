# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=easyrpg-rtp
pkgver=25.f15e1dd
pkgrel=1
pkgdesc="RPG Maker 2000/2003 material replacement "
arch=('any')
url="https://easy-rpg.org/"
license=('GPL3')
makedepends=('git' 'advancecomp')
depends=('easyrpg-player')
source=(${pkgname}::"git+https://github.com/EasyRPG/RTP.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
      cd ${pkgname}
      make optimize
}

package () {
  mkdir -p "${pkgdir}/usr/share/easyrpg"
  cp -r ${srcdir}/${pkgname} "${pkgdir}/usr/share/easyrpg/rtp"
  rm -r "${pkgdir}/usr/share/easyrpg/rtp/.git"
}
