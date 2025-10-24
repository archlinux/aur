# Maintainer: Troplo <troplo@troplo.com>
pkgname=flowinity-bin
pkgname_internal=flowinity-desktop
pkgver=1.0.11
pkgrel=1
pkgdesc="The dashboard for your digital life. Store and share images, write documents, and talk with your friends. (Binary version)"
arch=('x86_64')
url="https://flowinity.com"
license=('GPL-3.0-only')
conflicts=('flowinity')
provides=('flowinity')

source=("https://updates.flowinity.com/download/flavor/default/${pkgver}/linux_64/${pkgname_internal}-${pkgver}.tar.gz"
        "${pkgname_internal}.desktop"
        "flowinity.png")

package() {
  install -d "${pkgdir}/opt/${pkgname_internal}"

  tar -xzf ${pkgname_internal}-${pkgver}.tar.gz -C "${pkgdir}/opt/${pkgname_internal}"

  mv "${pkgdir}/opt/${pkgname_internal}/flowinity-${pkgver}"/* "${pkgdir}/opt/${pkgname_internal}/"
  ln -s "${pkgdir}/opt/${pkgname_internal}/flowinity" "${pkgdir}/opt/${pkgname_internal}/flowinity-desktop"
  rm -rf "${pkgdir}/opt/${pkgname_internal}/flowinity-${pkgver}"

  install -Dm644 ${srcdir}/${pkgname_internal}.desktop ${pkgdir}/usr/share/applications/${pkgname_internal}.desktop

  install -Dm644 ${srcdir}/flowinity.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/flowinity.png

}
sha256sums=('74b344d35bef0e99df1f40b2caacf681c98d9f3f53293fa40cb8791a3839adc4'
            'c7c22501503c13cfe7132b8677c6fc1c38471cf02516c55c92888d0afc96fcbb'
            '7e1c3148491581e1e73164402acb5dbd61e60c2143292cf6c4b37a31c07a4c9c')
sha256sums=('74b344d35bef0e99df1f40b2caacf681c98d9f3f53293fa40cb8791a3839adc4'
            'c7c22501503c13cfe7132b8677c6fc1c38471cf02516c55c92888d0afc96fcbb'
            '7e1c3148491581e1e73164402acb5dbd61e60c2143292cf6c4b37a31c07a4c9c')
