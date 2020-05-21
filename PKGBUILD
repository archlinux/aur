# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

_pkgname=Parachute
pkgname=kwin-scripts-parachute
pkgver=0.7.0
pkgrel=1
pkgdesc="Windows and desktops from above"
arch=(any)
url="https://github.com/tcorreabr/${_pkgname}"
license=(GPLv3)
depends=(kwin)
makedepends=(kpackage)
source=("$url/archive/v${pkgver}.zip")
sha256sums=('44b2ad9f5b1ed241f317de794e538b4aaae9719241a087c3f235b2c76090dccf')

package() {
  cd $srcdir/${_pkgname}-${pkgver}/
  kpackagetool5 --type Kwin/Script --install . -p "${pkgdir}/usr/share/kwin/scripts/"
  install -Dm644 metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
