# Maintainer: Ruslan Askarov <ruslan@festagency.com>
# Maintainer: Sergey Anisimov <sergey@festagency.com>
pkgname=monitask
pkgver=1.0
pkgrel=1
pkgdesc="Monitask desktop linux time tracker"
arch=("x86_64")
url=""
install=
license=('unknown')
source=("https://deskcap.blob.core.windows.net/deployment/Linux/arch/devel/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
options=('staticlibs')
md5sums=('c85fb6d6d0cfd0b9eddcbd83c8d658af')

package () {
  mkdir -p "${pkgdir}/opt/monitask"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${srcdir}/files/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/files/mt_znak.svg" "${pkgdir}/usr/share/pixmaps/$pkgname.svg"
  cp -ar ${srcdir}/${pkgname}-${pkgver}-${pkgrel}/* "${pkgdir}/opt/monitask/"
  chmod +x "${pkgdir}/opt/monitask/Monitask"
}
