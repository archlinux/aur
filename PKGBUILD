# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite
pkgver=0.0.2
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
sha256sums=('ece4ac9b2f049b67a8fe002f98b620372eb14bd48263c13e012f928cb576e2b4')
sha512sums=('8879a60f1a9a8245800b8a5ee78ffe8908b1d1f4bdebcd84fa417f091a77a374d00a28606c2df0857a35c05715f58dd525b9804a2d4216b8795d4c14e4de064c')
package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
