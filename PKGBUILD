# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.6
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
source=(https://github.com/tuxedocomputers/tuxedo-cc-wmi/archive/v${pkgver}.tar.gz)
sha256sums=('4640f0ae9dcb1fb341b75db37e16cc8b645b1cca31b7078e79a26d0d42f70b69')
sha512sums=('39ba22ab33a4229e18b711233460fa881d5cce867ab5c1a72cd912d752611f03b6ac9d42b304e465c4b65dca4c6205862878d61bc997c0e1355d9d0f71a97fc9')

package() {
  tar -vxzf "v${pkgver}.tar.gz" 
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
