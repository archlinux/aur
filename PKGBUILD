# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.3
pkgrel=2
pkgdesc="WMI method control for TUXEDO laptops"
arch=(x86_64)
url="https://www.tuxedocomputers.com"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
conflicts=('tuxedo-wmi' 'tuxedo-wmi-dkms')
source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/tuxedo-cc-wmi/tuxedo-cc-wmi_0.1.3_all.deb)
sha256sums=('2c9fe6bb907f74cbc1ce7239f850e83f9e29751792c92c0f6a42837b8506f066')
sha512sums=('4e815d678b409f90757e67f83d82b7e1eaa6824108df81ff73851a11b0cdf23c886a6ebaab4f43d1be4b9c3af345b6b5bfe48b1f3afea1ce2d4dc52c2c690d9f')

package() {
  ar vx "${srcdir}/tuxedo-cc-wmi_0.1.3_all.deb"
  tar -xf "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
