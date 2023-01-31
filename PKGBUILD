# Maintainer: Ruslan Askarov <ruslan@festagency.com>
# Maintainer: Sergey Anisimov <sergey@festagency.com>
pkgname=monitask
pkgver=1.0
pkgrel=17
pkgdesc="Monitask desktop linux time tracker"
arch=("x86_64")
url="https://www.monitask.com/Home/Download"
install=
license=('unknown')
source=("https://deskcap.blob.core.windows.net/deployment/Linux/arch/prod/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
options=('staticlibs')
depends=('libxss' 'xterm' 'libxfixes')
md5sums=('d3c5745a0c1a5037894953c00ece116a')

package () {
  mkdir -p "${pkgdir}/opt/monitask"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/files/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/files/mt_znak.svg" "${pkgdir}/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "${srcdir}/files/monitask.sh" "${pkgdir}/usr/bin/$pkgname.sh"

  cp -ar ${srcdir}/${pkgname}-${pkgver}-${pkgrel}/* "${pkgdir}/opt/monitask/"
  chmod +x "${pkgdir}/opt/monitask/Monitask"
  chmod +x "${pkgdir}/usr/bin/$pkgname.sh"
}
