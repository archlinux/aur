# Maintainer: Charlie Haley <charlie.haley@hotmail.com>

pkgname=udev-notify-daemon-bin
pkgver=0.1.0
pkgrel=9
pkgdesc="A simple daemon that listens for udev USB events and sends out a notification to dbus"
url="https://github.com/charlie-haley/udev-notify-daemon"
arch=("x86_64")
license=("MIT")
source_x86_64=(
  "udev-notify-daemon_amd64::https://github.com/charlie-haley/udev-notify-daemon/releases/download/v${pkgver}/udev-notify-daemon_amd64"
)
_srcname=udev-notify-daemon

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

    install -m644  $startdir/udev-notify-daemon.service ${pkgdir}/usr/lib/systemd/user || return 1
}
