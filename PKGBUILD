# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-speceq-bin'
pkgname=('zl-speceq-vst3-bin' 'zl-speceq-lv2-bin' 'zl-speceq-bin')
pkgver='0.0.1'
pkgrel=4
pkgdesc='Dynamic spectrum equalizer audio plugin.'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zlspeceq/'
license=('AGPL-3.0-only')
groups=('pro-audio')
depends=(
  'alsa-lib'
  'libx11'
  'libxcomposite'
  'libxcursor'
  'libxext'
  'libxinerama'
  'libxrandr'
  'libxrender'
  'freetype2'
  'fontconfig'
  'libxi'
)

source_x86_64=("https://github.com/ZL-Audio/ZLSpectrumEqualizer/releases/download/0.0.1/ZL.Spectrum.Equalizer-${pkgver}-Linux-x86-64-AVX2.zip")
source_aarch64=("https://github.com/ZL-Audio/ZLSpectrumEqualizer/releases/download/0.0.1/ZL.Spectrum.Equalizer-${pkgver}-Linux-arm64.zip")
sha256sums_x86_64=('79cca48c3de6fa5c0ae8b819b210b0342cc1700b1526d65d04d7dc885ad40e13')
sha256sums_aarch64=('c7acfe8beabb201ca947cfa1216349ccf373f0a83e0287283bd3b04a064a3f1f')

package_zl-speceq-vst3-bin() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'
  mkdir -p ${pkgdir}/usr/lib/vst3/
  cp -r ${srcdir}/VST3/* ${pkgdir}/usr/lib/vst3
}

package_zl-speceq-lv2-bin() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'
  mkdir -p ${pkgdir}/usr/lib/lv2/
  cp -r ${srcdir}/LV2/* ${pkgdir}/usr/lib/lv2
}

package_zl-speceq-bin() {
  pkgdesc+=' (metapackage that requires all lpugin formats)'
  depends+=('zl-speceq-vst3-bin' 'zl-speceq-lv2-bin')
}

# vim:set ts=2 sw=2 et:
