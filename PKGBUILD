# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=lightdm-cmd-greeter
pkgver=1.1.0
pkgrel=1
pkgdesc="a command line lightdm greeter"
arch=(any)
url="https://github.com/greyltc/cmd-greeter"
license=(GPL3)
depends=(lightdm python python-gobject)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greyltc/cmd-greeter/archive/v${pkgver}.tar.gz")
sha256sums=('ce25729bb35f30ef3b7fbe6fb6909b04969580170e5677ac0ca85556792d35bb')

package() {
  cd "cmd-greeter-${pkgver}"
  install -Dt "${pkgdir}/usr/share/dbus-1/system.d" -m644 com.greyltc.cgreet.conf
  install -Dt "${pkgdir}/usr/share/xgreeters" -m644 lightdm-cmd-greeter.desktop
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter-login
}
