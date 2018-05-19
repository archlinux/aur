# Maintainer: Edmund Wu <fangkazuto@gmail.com>

pkgname=kcore-meta
pkgver=0.1.0
pkgrel=1
pkgdesc='Core packages'
arch=('x86_64')
url='https://gitlab.com/eadwu/pkgbuilds'
license=('custom:unknown')
depends=(
  'acpi'
  'alsa-utils'
  'bluez'
  'bluez-libs'
  'bluez-utils'
  'gnome-keyring'
  'networkmanager'
  'network-manager-applet'
  'ntp'
  'pulseaudio'
  'pulseaudio-alsa'
  'pulseaudio-bluetooth'
  'xf86-input-libinput'
  'xorg-server'
  'xorg-xhost'
  'xorg-xinit'
  'xorg-xprop'
  'xorg-xsetroot'
  'xorg-xwininfo'
  'yaourt'
)

install () {
  install -Dm 0644 30-touchpad.conf "${pkgdir}/etc/X11/xorg.conf.d/30-touchpad.conf"
}

post_install () {
  echo '
### Automatically switch to newly-connected devices
load-module module-switch-on-connect' >> /etc/pulse/default.pa
}
