# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=openvr-ignition-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Allows you to run Windows-only SteamVR drivers on Linux, using Wine/Proton"
arch=('x86_64')
url="https://github.com/BnuuySolutions/Ignition"
license=('MIT')
source=(
  "ignition-$pkgver.zip::https://github.com/BnuuySolutions/Ignition/releases/download/v$pkgver/Ignition-Linux-Windows.zip"
)
sha512sums=(
  'a28c92aadc8cabdc8daff029acb1d6cb89b363ba999d33641b69ec85cc9877947879f0fb4b0613002eb436f89ec985f1e8dd8d6bbfe6f595929873b3fc5c4935'
)
provides=('openvr-ignition')
conflicts=('openvr-ignition')

package() {
    install -d "$pkgdir/opt/ignition"
    install -m 755 -t "$pkgdir/opt/ignition" \
        ${srcdir}/driver_install.sh \
        ${srcdir}/driver_uninstall.sh \
        ${srcdir}/ignition_bridge.dll \
        ${srcdir}/ignition_server.exe \
        ${srcdir}/install_ignition.sh \
        ${srcdir}/launch_serverhelper.sh \
        ${srcdir}/libdriver_ignition.so \
        ${srcdir}/proton \
        ${srcdir}/wine_hidraw.reg
}
