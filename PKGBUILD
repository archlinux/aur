# Maintainer: su-ex <codeworks@supercable.onl>
# Maintainer: SpiritCroc <aur@spiritcroc.de>
# Contributor: David Mehren <david.mehren@udo.edu>

pkgname=schildichat-desktop-bin
_pkgver=1.9.0-sc.1
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
sha256sums=('2c159ea68f7d7aa2bd0c0725463f6267fda6e4c29ee0c691d40f970a9ad1d667'
            'fbc7d9a5480a66e2623dbf05c0c51deee39bf35289d5b79325bfc4b87fa2a609')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm755 "${srcdir}"/schildichat-desktop.sh "${pkgdir}"/usr/bin/schildichat-desktop
}
