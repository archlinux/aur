# Maintainer: adogecheems <adogecheems@outlook.com>
#
# Generated from the already-validated Arch package in the matching GitHub
# release. Do not edit the generated PKGBUILD; update the source package and
# rerun packaging/scripts/generate-aur-bin.sh instead.

pkgname=panasonic-posture-manager-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Prebuilt posture management and screen orientation for convertible Linux 2-in-1 laptops'
arch=('x86_64')
url='https://github.com/adogecheems/panasonic-posture-manager'
license=('AGPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4>=4.12'
  'libadwaita>=1.4'
  'python>=3.11'
  'python-gobject'
  'systemd'
  'polkit'
  'dbus'
  'iio-sensor-proxy'
)
optdepends=(
  'gnome-shell: GNOME session notification server and desktop integration'
  'mutter: display rotation and orientation lock on GNOME Wayland'
  'gnome-settings-daemon: touchscreen orientation-lock GSettings schema on GNOME'
  'kscreen: display rotation and auto-rotate policy on Plasma 6.8+ (kscreenctl)'
  'libkscreen: display rotation and auto-rotate policy on Plasma 6.0-6.7 (kscreen-doctor)'
)
provides=('panasonic-posture-manager')
conflicts=('panasonic-posture-manager')
options=('!strip' '!debug')
install="${pkgname}.install"

_archive="panasonic-posture-manager-${pkgver}-1-x86_64.pkg.tar.zst"
source=("${_archive}::https://github.com/adogecheems/panasonic-posture-manager/releases/download/v${pkgver}/${_archive}")
sha256sums=('49a3ceba6f0884d060e899570b5aa1a20c33c3e1658ec5198cdc596e91190353')

package() {
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}" usr
}
