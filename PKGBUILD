# Maintainer: Matt Gray <Buddy.Matt1984@Gmail.com>
# Contributor: Nigel <nigelwestland@gmail.com>
# Contributor: Steven Seifried <gitlab@canox.net>
# Contributor: Kevin Van Lierde <kevin.van.lierde@gmail.com>

_pkgname='tuxedo-backlight-control'
pkgname="${_pkgname}-git"
pkgver=0.7.r14.gde724d7
pkgrel=2
arch=('x86_64')
license=('MIT')
url=https://github.com/webketje/tuxedo-backlight-control
source=('git+https://github.com/webketje/tuxedo-backlight-control')
sha256sums=('SKIP')
sha512sums=('SKIP')
pkgdesc='GUI utility built on top of TUXEDO Keyboard. Provides a bash CLI (backlight) and a minimal Python UI.'
depends=('python' 'tk' 'polkit' 'tuxedo-keyboard')
makedepends=('git')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/share/tuxedo-backlight-control/"
  install -Dm644 "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/backlight.py" "${pkgdir}/usr/local/bin/backlight"
  install -Dm644 "${srcdir}/tuxedo-backlight-control/src/usr/share/polkit-1/actions/webketje.tuxedo-backlight-control.policy" "${pkgdir}/usr/share/polkit-1/actions/webketje.tuxedo-backlight-control.policy"
  install -Dm644 "${srcdir}/tuxedo-backlight-control/src/usr/share/applications/tuxedo-backlight-control.desktop" "${pkgdir}/usr/share/applications/tuxedo-backlight-control.desktop"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/ui.py" "${pkgdir}/usr/share/tuxedo-backlight-control/ui.py"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/backlight.py" "${pkgdir}/usr/share/tuxedo-backlight-control/backlight.py"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/backlight_control.py" "${pkgdir}/usr/share/tuxedo-backlight-control/backlight_control.py"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/icon.png" "${pkgdir}/usr/share/tuxedo-backlight-control/icon.png"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/colors.py" "${pkgdir}/usr/share/tuxedo-backlight-control/colors.py"
  install -D "${srcdir}/tuxedo-backlight-control/LICENSE" "${pkgdir}/usr/share/licenses/LICENSE"
}
