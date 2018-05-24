# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=signet
pkgver=0.9.10
pkgrel=1
pkgdesc="Desktop Client for Signet"
arch=('x86_64')
makedepends=('gnupg')
license=('GPLv3')
provides=('signet')

source_x86_64=("https://nthdimtech.com/downloads/signet-releases/${pkgver}/gnu-linux/signet-${pkgver}"
               "https://nthdimtech.com/downloads/signet-releases/${pkgver}/gnu-linux/signet-${pkgver}.sig"
               "https://nthdimtech.com/downloads/signet-releases/${pkgver}/gnu-linux/50-signet.rules"
               "https://www.gnu.org/licenses/gpl.txt"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_16x16.png"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_32x32.png"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_64x64.png"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_128x128.png"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_256x256.png"
               "https://github.com/nthdimtech/signet-desktop-client/raw/master/client/images/signet.iconset/icon_512x512.png"
               "${pkgname}.desktop")
validpgpkeys=('D47581AE98C17249915387BE0E47D2FA6E50979D') # Neils Nesse
sha256sums_x86_64=('ed6e075c7823bda1e9ecba2343b94bc9935a0e4f0d81c58db6ea9844e4e53e75'
                   '69dd4475c81e66f145ff31a90447047516d1992c5aa8961079ec2c902018d518'
                   'af34a217fee566de4c149429459e4cd13f38435857ff8c9f5fd7bb0199e86820'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
                   '420da6b48346cfb2f726722a799c4fad70bdd2fcc0d5cb5753ecd129cf7ee35e'
                   'f511fa945aae0b210cd3873aa1cfb7ccc19d2f60c98e3d7bbbe2994b9859ec02'
                   '6ef93c8ec90007f17bb15bf7631780e041fe8053c6c35298e92671db30e697e7'
                   '9f3e202578c68020b95f34d30d0b783e17d6202041f23590d5adc6a246592d7d'
                   '5e8e5328d0f0955ae59645cb5a3c498f7051e738b96134b7874d4be486be753f'
                   '5e8e5328d0f0955ae59645cb5a3c498f7051e738b96134b7874d4be486be753f'
                   'f2e8c589df5c7791acad7e686d61cc525cfd4136a06e36b0ed507b22b08561b4')

package() {
  gpg --verify "signet-${pkgver}.sig" "signet-${pkgver}"
  install -Dm755 "${srcdir}/signet-${pkgver}" "${pkgdir}/usr/bin/signet"
  install -Dm666 "${srcdir}/50-signet.rules" "${pkgdir}/etc/udev/rules.d/50-signet.rules"
  install -Dm644 "${srcdir}/gpl.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/icon_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -Dm644 "${srcdir}/icon_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 "${srcdir}/icon_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 "${srcdir}/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "${srcdir}/icon_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "${srcdir}/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
