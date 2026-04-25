# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# vim:set ts=2 sw=2 et:

pkgname=airwindows-consolidated-bin
pkgver=2026.04.24.839bf8e
_airwin=$(echo ${pkgver} | sed -e 's/\./\-/g')
pkgrel=1
pkgdesc="The entirety of the Airwindows collection as LV2, VST3, and CLAP."
arch=('x86_64')
url="https://www.airwindows.com/consolidated/"
license=('GPL3')
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
options=('!debug')
conflicts=(airwindows-consolidated-git)
source=("AirwindowsConsolidated-${_airwin}-Linux.zip::https://github.com/baconpaul/airwin2rack/releases/download/DAWPlugin/AirwindowsConsolidated-${_airwin}-Linux.zip")
sha256sums=('8d367ae9a880ccc629c8552993ea1782f0fab8e77a3d80fc1ab1197d21c24563')


_install_plugin() {
  local type="$1"
  mkdir -p "$pkgdir/usr/lib/${type}"
  cp -r "$srcdir/awcons-products/Airwindows Consolidated.${type}" "$pkgdir/usr/lib/${type}/"
}

package() {
  _install_plugin "clap"
  _install_plugin "lv2"
  _install_plugin "vst3"
}

