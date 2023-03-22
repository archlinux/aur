# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.3.0
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
sha256sums=('4cb461f1bbced0ce3141d163e98064bedc1afedea897ba7f5acf554d1688f801')
sha512sums=('41b34a03137d5e9a5b4921bf4d60b706f02ea2ec3977ece8b1e831b6f236076a4fc78a68fa08fd6ee8a3673186c19cfac0df6221c84177954d28d0a75c61f086')
package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf"
}
