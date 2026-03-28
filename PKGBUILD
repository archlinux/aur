pkgname=pomodoro-fyne-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Desktop pomodoro timer built with Go and Fyne (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lyj404/pomodoro"
license=('MIT')
depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'hicolor-icon-theme'
)
provides=('pomodoro')
conflicts=('pomodoro')
source=(
  "pomodoro-${pkgver}-linux-amd64.tar.gz::https://github.com/lyj404/pomodoro/releases/download/v${pkgver}/pomodoro-${pkgver}-linux-amd64.tar.gz"
  "pomodoro.desktop::https://raw.githubusercontent.com/lyj404/pomodoro/v${pkgver}/packaging/pomodoro.desktop"
  "LICENSE::https://raw.githubusercontent.com/lyj404/pomodoro/v${pkgver}/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/pomodoro" "${pkgdir}/usr/bin/pomodoro"
  install -Dm644 "${srcdir}/pomodoro.desktop" "${pkgdir}/usr/share/applications/pomodoro.desktop"
  install -Dm644 "${srcdir}/app-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pomodoro.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
