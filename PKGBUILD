# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

_pkgname=Parachute
pkgname=kwin-scripts-parachute
pkgver=0.8.0
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url="https://github.com/tcorreabr/${_pkgname}"
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/v${pkgver}.zip")
sha256sums=('e842f3f6f81378f17f7c8f13956a1c5c450ab20703ff79cff9c2f5e0146971da')

package() {
  cd $srcdir/${_pkgname}-${pkgver}/
  kpackagetool5 --type Kwin/Script --install . -p "${pkgdir}/usr/share/kwin/scripts/"
  install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
