# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite
pkgver=0.0.3
pkgrel=1
pkgdesc="Per-key keyboard backlight driver for TUXEDO ITE Keyboards devices."
url="https://www.tuxedocomputers.com/"
license=("GPL")
arch=('x86_64') 
depends=('dkms')
conflicts=('tuxedo-keyboard')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
source=(http://rpm.tuxedocomputers.com/opensuse/15.2/noarch/${pkgname}-${pkgver}-1.noarch.rpm)
sha256sums=('6c13f6a75d4967412d6109f129ff41b0d2fc132c5de356700deb9487b70fb335')
sha512sums=('8344cf06b4e90f16497097b1a2d5215d737e4ba9855870bdc169552f6a584a5be8febcd3b0b816249625dcbc1715b9a72b2ddf1d64d056fd90f83499ff7e985a')
package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
