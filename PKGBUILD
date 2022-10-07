# Maintainer: Charlie Haley <charlie.haley@hotmail.com>

pkgname=udev-notify-daemon-bin
pkgver=0.1.3
pkgrel=12
pkgdesc="A simple daemon that listens for udev USB events and sends out a notification to dbus"
url="https://github.com/charlie-haley/udev-notify-daemon"
arch=("x86_64")
license=("MIT")
source=(
  "udev-notify-daemon_amd64::https://github.com/charlie-haley/udev-notify-daemon/releases/download/v${pkgver}/udev-notify-daemon_amd64"
  "https://raw.githubusercontent.com/charlie-haley/udev-notify-daemon/v${pkgver}/udev-notify-daemon.service"
)
sha256sums=(
    '206daa47fa8e6e7b3366cf2ccfc89f0ac505b2f46a88d2da6e2cb330f8d29cc2'
    'f113da8d274799b42849a0b0fd525166fe256cec7a59430560f96aa9a9844246'
)
_srcname=udev-notify-daemon

package() {
    install -Dm755 udev-notify-daemon_amd64 ${pkgdir}/usr/local/bin/udev-notify-daemon
    install -Dm755 udev-notify-daemon.service ${pkgdir}/usr/lib/systemd/user/udev-notify-daemon.service
}
