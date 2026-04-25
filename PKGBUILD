# Maintainer: HInspect0r

pkgname="first-driver-station"
pkgver=2027.0.0_alpha
pkgrel=2
_tag="${pkgver//_/-}-${pkgrel}"
pkgdesc="Public releases of the FIRST Driver Station used for controlling FRC and FTC robots"
arch=('x86_64')
url="https://github.com/wpilibsuite/FirstDriverStation-Public"
license=('LicenseRef-Commercial')
depends=('libinput' 'libusb' 'systemd-libs' 'avahi')
source_x86_64=("${url}/releases/download/v${_tag}/FirstDriverStation-linux-x64-${_tag}.tar.gz"
    FirstDriverStation.desktop
    FirstDriverStation.png
    FirstDriverStation.sh)
sha256sums_x86_64=('3270d5e854126283dade342b5eef9a0fa51e341f593b832d0873aa1d39f97a2f'
                   'bb2b4748495e4d9c94dad811244d106fc581595ddfd5c2c4a6f4f9f0743401d5'
                   '46b858bcc2879895f174007e6d9875469f8ba6f6499595934c4e1736ab535cfc'
                   'a94ce86db45ad14761dd339e568ad843af524a549cbe2d0e5c308d0189080016')

package() {
  install -Dm755 "${srcdir}/FirstDriverStation" "${pkgdir}/opt/FirstDriverStation/FirstDriverStation"
  install -Dm755 "${srcdir}/libSkiaSharp.so" "${pkgdir}/opt/FirstDriverStation/libSkiaSharp.so"
  install -Dm755 "${srcdir}/libHarfBuzzSharp.so" "${pkgdir}/opt/FirstDriverStation/libHarfBuzzSharp.so"

  install -Dm644 "FirstDriverStation.desktop" "${pkgdir}/usr/share/applications/FirstDriverStation.desktop"
  install -Dm644 "FirstDriverStation.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/FirstDriverStation.png"
  install -Dm755 "FirstDriverStation.sh" "${pkgdir}/usr/bin/FirstDriverStation"
}
