# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.4.3
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
sha256sums=('789136b536e833147e0ca69450404934e0d119324640078e73621eea75377987')
sha512sums=('5130c04cfe938ed5b2f34b17800be3edbf53f37f470fd61cb158f3342ea418dc0e6ca1f36925ce4fe1cdf4d71447bcf2ed1cd2636d84fc50997cc7ae778d52a6')
package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf"
}
