# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=stream-alert
pkgver=1.0.1
tag=v1.0.1
pkgrel=1
pkgdesc="Get a Telegram notification when your webcam or screen changes"
arch=('x86_64')
url="https://github.com/akoidan/stream-alert"
license=('MIT')
depends=(
    libjpeg
    v4l-utils
)

install=stream-alert.install
source=(
  "stream-alert::${url}/releases/download/${tag}/stream-alert.elf"
  "stream-alert.service"
  "stream-alert.install"
)
options=(!strip)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -D -m755 "${srcdir}/stream-alert" "${pkgdir}/usr/bin/stream-alert"
  install -D -m644 "${srcdir}/stream-alert.service" "${pkgdir}/usr/lib/systemd/user/stream-alert.service"
}
