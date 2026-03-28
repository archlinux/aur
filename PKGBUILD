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
sha256sums=('07e29a4ca3fb5a74f21d258eda5eda7b2e860ae48337804aa648e7f27eda4db6'
            '42026a3665779923f6d3a8c3681043dffc487a0cbb21f06f399088714488607b'
            '3f17da507245c7f0429efdfe686cb9c6c399031bb71dd8261ae2e17fd27cecc0')

package() {
  install -Dm755 "${srcdir}/pomodoro" "${pkgdir}/usr/bin/pomodoro"
  install -Dm644 "${srcdir}/pomodoro.desktop" "${pkgdir}/usr/share/applications/pomodoro.desktop"
  install -Dm644 "${srcdir}/app-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pomodoro.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
