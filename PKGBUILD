# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=lightdm-cmd-greeter
pkgver=1.2.0
pkgrel=1
pkgdesc="super minimal, non-graphical, terminal based desktop session launcher via lightdm"
arch=(any)
url="https://github.com/greyltc-org/cmd-greeter"
license=(GPL3)
depends=(lightdm python python-gobject)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greyltc-org/cmd-greeter/archive/v${pkgver}.tar.gz")
sha256sums=('7e6bde6db8d5ad23f2d0f48c476c8df33e0f0cb08688eb82a39e5d02e5e7a706')

package() {
  cd "cmd-greeter-${pkgver}"
  install -Dt "${pkgdir}/usr/share/dbus-1/system.d" -m644 org.greyltc.cgreet.conf
  install -Dt "${pkgdir}/usr/share/xgreeters" -m644 lightdm-cmd-greeter.desktop
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter-login
}
