# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=q2rtx-data
pkgver=1.8.0
pkgrel=1
pkgdesc="Additional data for q2rtx"
arch=(any)
url="https://github.com/NVIDIA/Q2RTX"
license=(custom)
source=("https://github.com/NVIDIA/Q2RTX/releases/download/v${pkgver}/q2rtx-${pkgver}-linux.tar.gz")
sha256sums=('7467a33056d8c98f9abef6bfdb02a6a2904a311ec669c59a68241cf588f93222')

package() {
  cd q2rtx
  install -d "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  #cp -r baseq2/players "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  install baseq2/*.pak "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  install baseq2/*.pkz "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  install -D notice.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
