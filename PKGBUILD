# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.5
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
sha256sums=('ee7b5ea5c37d53e3108b7da6482f226111561a75952c14067dbbe8d5c530e535')
sha512sums=('7207335a45532b39f0765497c2f65c44bbdb224d49c6f5741417223355ef5560ac116102be3539f66613756e9572b24a6cdca800874b3d4bd6af8d6d763ee3b8')

package() {
  tar -vxzf "v${pkgver}.tar.gz" 
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
