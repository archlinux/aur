# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.7
pkgrel=2
pkgdesc="An interface to the WMI methods on TUXEDO laptops. "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-cc-wmi"
license=('GPL3')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
conflicts=('tuxedo-wmi' 'tuxedo-wmi-dkms' 'tuexdo-cc-wmi-dkms')
source=(http://rpm.tuxedocomputers.com/opensuse/15.2/noarch/tuxedo-cc-wmi-${pkgver}-1.noarch.rpm)

sha256sums=('106197106fb9b9bc7418089e999f2c6ea7fbad9f704f7a9a2b0910a4a911faa8')
sha512sums=('b704c33ff23ff876d901c37034303bc13b977634283abfaac42051245325b6db177e4d8eecf53038047cca81e652188bc826e6df4b73a1c8f1da8acf2ad569f9')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
