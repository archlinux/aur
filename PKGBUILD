# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
_pkgbase=tuxedo-keyboard
pkgver=2.0
pkgrel=1
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL")
arch=('x86_64') 
makedepends=('git' 'linux-headers' 'gcc' 'make')
depends=('dkms')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-wmi' 'tuxedo-wmi-dkms')
source=('git+https://github.com/tuxedocomputers/tuxedo-keyboard.git' 'tuxedo_keyboard.conf')
sha512sums=('SKIP' '76158393cae3959af9a0ccef7e3f72d44522796f1ea81d031a91958c47d6f48f83bf8311a1932bb4db7dd35abae1603f1051f1d0e315a0484053ede97e2e7de7')
install="${pkgname}.install"
package() {
  install -D "${srcdir}/${pkgname}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  install -D "${srcdir}/tuxedo_keyboard.conf" "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
