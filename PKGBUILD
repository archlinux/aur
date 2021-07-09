# Maintainer: su-ex <codeworks@supercable.onl>
# Maintainer: SpiritCroc <aur@spiritcroc.de>
# Contributor: David Mehren <david.mehren@udo.edu>

pkgname=schildichat-desktop-bin
_pkgver=1.7.32-sc1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SchildiChat is a Matrix client based on Element with a more traditional instant messaging experience."
arch=('x86_64')
url="https://schildi.chat"
license=('Apache')
depends=('sqlcipher')
provides=('schildichat-desktop')
conflicts=('schildichat-desktop')
source=("https://github.com/SchildiChat/schildichat-desktop/releases/download/v${_pkgver}/schildichat-desktop_${_pkgver}_amd64.deb"
        "schildichat-desktop.sh")
sha256sums=('8a972df9b6193fb7ad43cb0a3de943f13897834ff2ca8f0176ad2fda1e1692f7'
            'fbc7d9a5480a66e2623dbf05c0c51deee39bf35289d5b79325bfc4b87fa2a609')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/schildichat-desktop.sh "${pkgdir}"/usr/bin/schildichat-desktop
}
