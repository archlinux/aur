# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite
pkgver=0.2.2
pkgrel=1
pkgdesc="Per-key keyboard backlight driver for TUXEDO ITE Keyboards devices."
url="https://www.tuxedocomputers.com/"
license=("GPL")
arch=('x86_64') 
depends=('dkms' 'tuxedo-keyboard')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
source=(http://rpm.tuxedocomputers.com/opensuse/15.2/noarch/${pkgname}-${pkgver}-1.noarch.rpm)
sha256sums=('120a8b842312b897465dec3183e00581795f424a0b0835251c11400efa55040b')
sha512sums=('71e699444d9d5d920621b838f09e123f19563b1a388bfb23e269b38af9b7eff7f953386634f01ed66570973f59b81ea032b48397fb2963ec3ac638b1eb95ddf3')
package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
