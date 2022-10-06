# Maintainer: Charlie Haley <charlie.haley@hotmail.com>

pkgname=udev-notify-daemon-bin
pkgver=0.1.1
pkgrel=10
pkgdesc="A simple daemon that listens for udev USB events and sends out a notification to dbus"
url="https://github.com/charlie-haley/udev-notify-daemon"
arch=("x86_64")
license=("MIT")
source=(
  "udev-notify-daemon_amd64::https://github.com/charlie-haley/udev-notify-daemon/releases/download/v${pkgver}/udev-notify-daemon_amd64"
  "https://raw.githubusercontent.com/charlie-haley/udev-notify-daemon/v${pkgver}/udev-notify-daemon.service"
)
sha256sums=(
    '4788fa65bed9fa4638d6027a98bb185d63f568101e839343d61aedc80d78af47'
    'f113da8d274799b42849a0b0fd525166fe256cec7a59430560f96aa9a9844246'
)
_srcname=udev-notify-daemon

package() {
	install -Dm755 udev-notify-daemon_amd64 "${pkgdir}/usr/bin/${_srcname}"
    install -Dm755  udev-notify-daemon.service ${pkgdir}/usr/lib/systemd/user || return 1
}
