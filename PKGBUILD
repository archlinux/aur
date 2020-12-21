# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

_pkgname=Parachute
pkgname=kwin-scripts-parachute
pkgver=0.9.0
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url="https://github.com/tcorreabr/${_pkgname}"
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/v${pkgver}.zip")
sha256sums=('e390dc16ad694c11558687d6c8f9caaa25aca622952ace80ca64203ac337260d')

package() {
  cd $srcdir/${_pkgname}-${pkgver}/
  kpackagetool5 --type Kwin/Script --install . -p "${pkgdir}/usr/share/kwin/scripts/"
  install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
