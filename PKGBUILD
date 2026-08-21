# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: usrmusicman

pkgbase=socalabs-wavetable
pkgname=($pkgbase-lv2-bin $pkgbase-vst-bin $pkgbase-vst3-bin)
pkgver=1.0.36
pkgrel=1
arch=(x86_64)
url='https://socalabs.com/synths/wavetable/'
license=(BSD-3-Clause)
groups=(pro-audio)
depends=(curl fontconfig freetype2 glibc libgcc libstdc++)
makedepends=(unzip)
source=("LICENSE-socalabs-wavetable::https://github.com/FigBug/Wavetable/raw/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$pkgbase-$pkgver.zip::https://socalabs.com/files/get.php?id=Wavetable_Linux.zip")
sha256sums=('65723088b243ad18fdd0417c911deac03593ded0b7a089b0d100a988528c8af3')
sha256sums_x86_64=('df62945366ae782e1f068b3b2b67137e31683a20553437bec8beca5a123ee23f')

package_socalabs-wavetable-lv2-bin() {
  depends+=(libcurl.so libfontconfig.so libfreetype.so libgcc_s.so libstdc++.so)
  pkgdesc="Socalabs Retro Wavetable Synth (LV2)"
  groups+=(lv2-plugins)
  optdepends=('lv2-host: for loading the LV2 plugin')
  install -v -Dm644 "$srcdir"/lv2/Wavetable.lv2/*.ttl -t "$pkgdir"/usr/lib/lv2/Wavetable.lv2
  install -v -Dm755 "$srcdir"/lv2/Wavetable.lv2/*.so -t "$pkgdir"/usr/lib/lv2/Wavetable.lv2
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_socalabs-wavetable-vst-bin() {
  depends+=(libcurl.so libfontconfig.so libfreetype.so libgcc_s.so libstdc++.so)
  pkgdesc="Socalabs Retro Wavetable Synth (VST)"
  groups+=(vst-plugins)
  optdepends=('vst-host: for loading the VST2 plugin')
  install -v -Dm755 "$srcdir"/vst/Wavetable.so -t "$pkgdir"/usr/lib/vst
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_socalabs-wavetable-vst3-bin() {
  depends+=(libcurl.so libfontconfig.so libfreetype.so libgcc_s.so libstdc++.so)
  pkgdesc="Socalabs Retro Wavetable Synth (VST3)"
  groups+=(vst3-plugins)
  optdepends=('vst3-host: for loading the VST3 plugin')
  install -v -Dm644 "$srcdir"/vst3/Wavetable.vst3/Contents/Resources/moduleinfo.json \
    -t "$pkgdir"/usr/lib/vst3/Wavetable.vst3/Contents/Resources
  install -v -Dm755 "$srcdir"/vst3/Wavetable.vst3/Contents/x86_64-linux/Wavetable.so \
    -t "$pkgdir"/usr/lib/vst3/Wavetable.vst3/Contents/x86_64-linux/
  install -v -Dm 644 "$srcdir"/LICENSE-socalabs-wavetable \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
