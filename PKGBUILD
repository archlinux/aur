# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.4.4
pkgrel=2
pkgdesc="Per-key keyboard backlight driver for TUXEDO ITE Keyboards devices."
url="https://github.com/tuxedocomputers/tuxedo-keyboard-ite"
license=("GPL")
arch=('x86_64') 
depends=('dkms' 'tuxedo-keyboard-dkms')
conflicts=('tuxedo-keyboard-ite')
replaces=('tuxedo-keyboard-ite')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard-ite/archive/v${pkgver}.tar.gz)
sha256sums=('de5b05f7a80ebe7e8951190e50e67c2c0ec58bb3c032606f9fc720cbb40edaa7')
sha512sums=('659b17104298ade2c794fd2dae184fee2185697fc58af6e6df27bfe5beef9920e61fbfeb4c5a6a75fc9d2f16227e616f7a3e9c3ac9b08dbd20cce399a1303de2')

package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
}
