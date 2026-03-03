# Maintainer: Jonas Karlsson <jonaskarlsson at fripost dot org>

pkgname=thinkfan-tui-bin
_pkgname=thinkfan-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal-based Linux application for fan control and temperature monitoring on ThinkPad laptops. (Prebuilt binary)"
url="https://github.com/karjonas/thinkfan-tui"
license=('MIT')
arch=('x86_64')
depends=('lm_sensors')
provides=('thinkfan-tui')
conflicts=('thinkfan-tui')

source=(
  "${_pkgname}-${pkgver}-x86_64.zip::https://github.com/karjonas/thinkfan-tui/releases/download/0.3.1/thinkfan-tui-27dfb44-x86_64-unknown-linux-musl.zip"
  "LICENSE::https://raw.githubusercontent.com/karjonas/thinkfan-tui/${pkgver}/LICENSE"
)

sha256sums=('83df9a072b48990a6b47b9f55eb07b7f03cffc74cf5a4f18e43bb672a862604a'
            '57f24c5e87b41083c4880dafbe980a601886416b19d8ae351d2e3ac1fe51942e')

package() {
    cd "$srcdir"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}