# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# vim:set ts=2 sw=2 et:

pkgname=airwindows-consolidated-bin
pkgver=2025.12.07.a797d6c
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
sha256sums=('df28a23a27b5600d66f0329f82a3842d885ff79eef92a0091f8e8168d6e4e83d')


package() {
  mkdir -p "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/lv2" "$pkgdir/usr/lib/vst3"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.clap" "$pkgdir/usr/lib/clap/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.lv2" "$pkgdir/usr/lib/lv2/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.vst3" "$pkgdir/usr/lib/vst3/"
}

