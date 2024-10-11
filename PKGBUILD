# Maintainer: tlss <cn dot jlu dot lp dot 5212 at gmail dot com>

pkgname=mitk
pkgver=2024.06
pkgrel=2
pkgdesc="Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software."
arch=('x86_64')
url="https://mitk.org"
license=('BSD')
depends=(
  'qt6-svg'
  'qt6-tools'
  'qt6-webengine'
)
source=(
  "https://www.mitk.org/download/releases/MITK-2024.06.2/Ubuntu%2022.04/MITK-v2024.06.2-linux-x86_64.tar.gz"
  "LICENSE"
  "MitkWorkbench"
  "MitkWorkbench.desktop"
)
sha256sums=(
  "efb23092b5fdcbd75d300200d9a34ad1522394106d79fe02f2c19b7274fffd52"
  "e738b539907754ee44cf101687df6b9e31ed7176a11dea077eadfd2f280cbb68"
  "c12894b678a979ca5db2df171660518d217281304b6bbdbac557a7857148be26"
  "b942f8c16e5c9fcf771b81e10ef5034e76d03d57e82b05c14bdaf90d6f0827bf"
)

options=(!strip)

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/MitkWorkbench" "${pkgdir}/opt/${pkgname}-${pkgver}.${pkgrel}/MitkWorkbench"
  install -Dm644 "${srcdir}/MitkWorkbench.desktop" "${pkgdir}/usr/share/applications/MitkWorkbench.desktop"
  install -Dm644 "${srcdir}/MITK-v${pkgver}.${pkgrel}-linux-${arch}/bin/mitk.ico" "${pkgdir}/usr/share/pixmaps/mitk.ico"

  install -d "${pkgdir}/opt/${pkgname}-${pkgver}.${pkgrel}"
  cp -r "${srcdir}/MITK-v${pkgver}.${pkgrel}-linux-${arch}/bin" "${pkgdir}/opt/${pkgname}-${pkgver}.${pkgrel}/"
}
