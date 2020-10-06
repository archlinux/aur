# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.7
pkgrel=1
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


package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
md5sums=('d3f341caff3adebd6f361e050a4cebd6')
