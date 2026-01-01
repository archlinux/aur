# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=stream-alert
pkgver=1.0.2
tag=v1.0.2
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
sha256sums=('efa759bbe4edf8c26273cd54ce5796c722ee0a246be90b272d12a2bc3ab6c2fa'
            '18c7fd76bb4dd6dc1f2206f604a0a8751d944b1d47c963e0f61bb006967642a7'
            '0ae764b4158b2dc475d118c8a750da97ab09222674260b8ea587119fe2973fc3')

package() {
  install -D -m755 "${srcdir}/stream-alert" "${pkgdir}/usr/bin/stream-alert"
  install -D -m644 "${srcdir}/stream-alert.service" "${pkgdir}/usr/lib/systemd/user/stream-alert.service"
}
