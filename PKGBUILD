# Maintainer: Troplo <troplo@troplo.com>
pkgname=flowinity
pkgname_internal=flowinity-desktop
pkgver=1.0.4
pkgrel=1
pkgdesc="Flowinity/PrivateUploader Desktop (Binary version)"
arch=('x86_64')
url="https://flowinity.com"
license=('GPL')

source=("https://updates.flowinity.com/download/flavor/default/${pkgver}/linux_64/${pkgname_internal}-${pkgver}.tar.gz"
        "${pkgname_internal}.desktop"
        "flowinity.png")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -d "${pkgdir}/opt/${pkgname_internal}"

  tar -xzf ${pkgname_internal}-${pkgver}.tar.gz -C "${pkgdir}/opt/${pkgname_internal}"

  mv "${pkgdir}/opt/${pkgname_internal}/${pkgname_internal}-${pkgver}"/* "${pkgdir}/opt/${pkgname_internal}/"

  install -Dm644 ${srcdir}/${pkgname_internal}.desktop ${pkgdir}/usr/share/applications/${pkgname_internal}.desktop

  install -Dm644 ${srcdir}/flowinity.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/flowinity.png

}
