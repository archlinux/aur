# Maintainer: Ruslan Askarov <ruslan@festagency.com>
# Maintainer: Sergey Anisimov <sergey@festagency.com>
pkgname=monitask
pkgver=1.0
pkgrel=5
pkgdesc="Monitask desktop linux time tracker"
arch=("x86_64")
url="https://www.monitask.com/Home/Download"
install=
license=('unknown')
source=("https://deskcap.blob.core.windows.net/deployment/Linux/arch/prod/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
options=('staticlibs')
depends=('libxss' 'xterm')
md5sums=('e325522a9bc0d2d810b04ad5bff30de4')

package () {
  mkdir -p "${pkgdir}/opt/monitask"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/files/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/files/mt_znak.svg" "${pkgdir}/usr/share/pixmaps/$pkgname.svg"
  cp -ar ${srcdir}/${pkgname}-${pkgver}-${pkgrel}/* "${pkgdir}/opt/monitask/"
  chmod +x "${pkgdir}/opt/monitask/Monitask"
}
