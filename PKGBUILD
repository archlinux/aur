# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite-dkms
pkgver=0.4.0
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
sha256sums=('0142a8a0fc45e1bef22127372587abb7c980058ae93ed74f85079b73d6ada56e')
sha512sums=('615e44dbe2b0bc302dea72becf354c256a57547db5eb82fe058123a2b46520e467eb2211fe7c1ba481182b9670a82f53692057d97a61f96365e8cbd8446283b8')
package() {
  mkdir -p "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-keyboard-ite-${pkgver}/dkms.conf"
}
