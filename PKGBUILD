# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=lightdm-cmd-greeter
pkgver=1.0.0
pkgrel=1
pkgdesc="a command line lightdm greeter"
arch=('any')
url="https://github.com/greyltc/cmd-greeter"
license=('GPL3')
depends=('lightdm' 'python' 'python-pydbus')
source=("https://github.com/greyltc/cmd-greeter/archive/v${pkgver}.tar.gz")
sha256sums=('01c02e785049cad73d77d9d746f31ce34552e46297a5e7627fc794ce9eece48e')

package() {
  cd "cmd-greeter-${pkgver}"
  install -Dt "${pkgdir}/usr/share/dbus-1/system.d" -m644 com.greyltc.cgreet.conf
  install -Dt "${pkgdir}/usr/share/xgreeters" -m644 lightdm-cmd-greeter.desktop
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter
  install -Dt "${pkgdir}/usr/bin" -m755 lightdm-cmd-greeter-login
}
