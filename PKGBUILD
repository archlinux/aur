# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
_pkgbase=tuxedo-keyboard
pkgver=2.0.0
pkgrel=8
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL")
arch=('x86_64') 
makedepends=('gcc' 'make')
depends=('git' 'dkms' 'linux-headers')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-wmi' 'tuxedo-wmi-dkms')
replaces=('tuxedo-keyboard-dkms')
source=('git+https://github.com/tuxedocomputers/tuxedo-keyboard.git' 'tuxedo_keyboard.conf')
sha256sums=('SKIP' '612dd06a393cb59321dc8c0e055b2662938e4a492538483ceabbbc9e4f274e49')
sha512sums=('SKIP' '314dce8cba9d09f16d4fa128e909bfa782e10566c97c8a5de3ad253ca76a4fd72001fd5f9e36cc926d010b829b6a88b10ca196fd941e288996949fb8200e712c')
install="${pkgname}.install"
package() {
  install -D "${srcdir}/${pkgname}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  install -D "${srcdir}/tuxedo_keyboard.conf" "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
  cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
