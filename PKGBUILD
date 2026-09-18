# Maintainer: DJisaiah <djisaiah_dev@hotmail.com>
pkgname='pomo-tracker-bin'
pkgver='0.2.0'
pkgrel=1
pkgdesc="A pomodoro app with good stats metrics and a social twist. "
arch=('x86_64')
url="https://github.com/DJisaiah/pomo-tracker"
license=('MIT')
depends=('xdg-user-dirs' 'gtk3' 'libsecret' 'mpv' 'gstreamer')
options=('!strip')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/DJisaiah/pomo-tracker/releases/download/v${pkgver}/pomo-tracker-v${pkgver}-linux-x64.tar.gz"
  "pomo-tracker.desktop"
  "app-icon.png::https://raw.githubusercontent.com/DJisaiah/pomo-tracker/main/src/assets/icon.png"
)
sha256sums=('309d9b74b72afddcfa22911447ec2a67463f0883824e7efafcd8c3beb29a5942'
    '9c1f085a5b178d09519a08c3c2454d3383da7e0dace0bb2ab6aaafd28ea4d446'
    'e97267b831397946176ba850aad5fe41ff7816f2d93350cbd4190260cae85803'
)

package() {
  install -d "${pkgdir}/usr/lib/pomo-tracker"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/"* "${pkgdir}/usr/lib/pomo-tracker/"

  ln -s "/usr/lib/pomo-tracker/Pomo-Tracker" "${pkgdir}/usr/bin/pomo-tracker"

  install -Dm644 "${srcdir}/pomo-tracker.desktop" "${pkgdir}/usr/share/applications/pomo-tracker.desktop"
  install -Dm644 "${srcdir}/app-icon.png" "${pkgdir}/usr/share/pixmaps/icon.png"
}
