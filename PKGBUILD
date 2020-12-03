# Maintainer: su-ex <codeworks@supercable.onl>
# Maintainer: SpiritCroc <aur@spiritcroc.de>
# Contributor: David Mehren <david.mehren@udo.edu>

pkgname=schildichat-desktop-bin
pkgver=1.7.14
pkgrel=1
pkgdesc="A Matrix Client based on Element with a more traditional instant messaging experience"
arch=('x86_64')
url="https://schildi.chat"
license=('Apache')
depends=('sqlcipher')
provides=('schildichat-desktop')
conflicts=('schildichat-desktop')
source=("https://github.com/SchildiChat/schildichat-desktop/releases/download/v${pkgver}/schildichat-desktop_${pkgver}_amd64.deb"
        "schildichat-desktop.sh")
sha256sums=('8e21999ee97ebdcb12bf7d0b19abb139b94044e50b447f0d5a66ca92214cfb33'
            'fbc7d9a5480a66e2623dbf05c0c51deee39bf35289d5b79325bfc4b87fa2a609')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/schildichat-desktop.sh "${pkgdir}"/usr/bin/schildichat-desktop
}
