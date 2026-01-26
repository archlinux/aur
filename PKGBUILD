# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# vim:set ts=2 sw=2 et:

pkgname=airwindows-consolidated-bin
pkgver=2026.01.25.0166a4c
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
sha256sums=('a54a65e8e39f409a066a6b24386bc97124ce17ef8683bfa90d5b61c0d69812c1')


package() {
  mkdir -p "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/lv2" "$pkgdir/usr/lib/vst3"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.clap" "$pkgdir/usr/lib/clap/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.lv2" "$pkgdir/usr/lib/lv2/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.vst3" "$pkgdir/usr/lib/vst3/"
}

