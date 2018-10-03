# Maintainer: Ivan Semkin <ivan at semkin dot ru>

pkgname=cuteshapes-git
_pkgname=cuteshapes
pkgver=r19.be3d485
pkgrel=1
pkgdesc='Live wallpapers for KDE Plasma 5 by trueleo'
url='https://github.com/trueleo/me.trueleo.cuteshapes'
arch=(any)
license=(GPL3)
depends=(plasma-workspace)
source=('git+https://github.com/trueleo/me.trueleo.cuteshapes')
sha256sums=('SKIP')

pkgver() {
  cd me.trueleo.cuteshapes
  echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  rm -rf me.trueleo.cuteshapes/README.md me.trueleo.cuteshapes/LICENSE me.trueleo.cuteshapes/.git
  install -d ${pkgdir}/usr/share/plasma/wallpapers/
  mv me.trueleo.cuteshapes ${pkgdir}/usr/share/plasma/wallpapers/
}
# vim:set ts=2 sw=2 et:
