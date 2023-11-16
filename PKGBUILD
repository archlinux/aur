# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.4.4
pkgrel=1
pkgdesc="Per-key keyboard backlight driver for TUXEDO ITE Keyboards devices."
url="https://www.tuxedocomputers.com/"
license=("GPL")
arch=('x86_64') 
depends=('dkms' 'tuxedo-keyboard-dkms')
conflicts=('tuxedo-keyboard-ite')
replaces=('tuxedo-keyboard-ite')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
source=(http://rpm.tuxedocomputers.com/opensuse/15.4/noarch/tuxedo-keyboard-ite-${pkgver}-1.noarch.rpm)
sha256sums=('9342dd4b145cfe2f33e17648c3a9468fb01f514206fcf52348545586ed4db0a2')
sha512sums=('0a067e31a76d22a75a01147ab15c0bec27a28294d7779649507af680cf115598c3bac0a6c66c52c8e1c47a53b2f070207df2828ffaf20cd8fa6e99a27ddfbc2c')
package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf"
}
