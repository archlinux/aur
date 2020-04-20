# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.3
pkgrel=3
pkgdesc="WMI method control for TUXEDO laptops"
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-cc-wmi"
license=('GPL3')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
conflicts=('tuxedo-wmi' 'tuxedo-wmi-dkms')
source=('https://github.com/tuxedocomputers/tuxedo-cc-wmi/archive/v0.1.3.tar.gz')
sha256sums=('a9c41e392ec3ba88bce5e42164e9376fb3f44fd9275baaea9876d3466982917b')
sha512sums=('c410616b1c7dffe71e4b01fcf45312f15624c2daa0abebdc901fc3752120461cd1f9fd22e44f26c0c3f6a55d6827bb05d07169821bafc8abe6fb98b0683de712')

package() {
  tar -vxzf "v${pkgver}.tar.gz" 
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
