# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.2.5
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
sha256sums=('0b174922c78a3226f58e0e1ecd318d3db2497c48812a55b81546d505301b80a5')
sha512sums=('1391fccf4cf42eedb0d4123be5e50f9a17f7356fbc85a81a437c04503be258cae6182170ad2af5458684c7bd7764e3fa2f3defa29422e354f745a0ce6289ffe5')
package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf"
}
