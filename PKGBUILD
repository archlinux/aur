# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-cc-wmi
pkgver=0.1.2
pkgrel=1
pkgdesc="WMI method control for TUXEDO laptops"
arch=(x86_64)
url="https://aur.archlinux.org/packages/tuxedo-cc-wmi/"
license=('GPL')
depends=('dkms')
conflicts=('tuxedo-wmi' 'tuxedo-wmi-dkms')

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/tuxedo-cc-wmi/tuxedo-cc-wmi_0.1.2_all.deb)
sha256sums=('ee9060fd91467824cb9883d453c95e5ee84decf3cc26479231a38cb30d9b5e0a')
sha512sums=('b605d64388177aba54135db57c10204d0d2db99b9997e7cd8c85359c6dbc1b97d54c78c1ca78a1b166e0016e83ed6353e2755dd90fe4bc048d43b160a1135778')

package() {
  ar vx "${srcdir}/tuxedo-cc-wmi_0.1.2_all.deb"
  tar -xf "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/usr/src/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -D "${srcdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
