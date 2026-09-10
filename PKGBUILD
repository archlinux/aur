# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=openvr-ignition-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Allows you to run Windows-only SteamVR drivers on Linux, using Wine/Proton"
arch=('x86_64')
url="https://github.com/BnuuySolutions/Ignition"
license=('MIT')
source=(
  "ignition-$pkgver.zip::https://github.com/BnuuySolutions/Ignition/releases/download/v$pkgver/Ignition-Linux-Windows.zip"
)
sha512sums=(
  '2efc3c0a025df5738df49259152ba4c28b5ae025f7e40fd1000ad1fc68f97eaf130c9f237eaee2dc6374943267731ce4d2636a59b0ac46c6fc98267c59e876f0'
)

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
        ${srcdir}/wine_psvr2_hidraw.reg
}