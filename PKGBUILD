# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard-ite
pkgver=0.1.0
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
sha256sums=('1488805fe84537986a1ba1c4b20926bfb59a1b6a0fcdc26a1367f6ea115f7c04')
sha512sums=('dc0467ed89728b7f4744a60cb7f9c591a0e7c55c656ec750d04c4b91e47212e05093fdd948102a05b027a89a98b7dd9b315e4b2f8b0a5cfa90115e0c32064e02')
package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
