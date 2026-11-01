# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-limiter-bin'
pkgname=('zl-limiter-vst3-bin' 'zl-limiter-lv2-bin' 'zl-limiter-bin')
pkgver='0.0.1'
pkgrel=1
pkgdesc='Mastering limiter plugin'
arch=('x86_64' 'aarch64')
url='https://zl-audio.github.io/plugins/zllimiter/'
license=('AGPL-3.0-only')
groups=('pro-audio' 'zl-audio')
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

source_x86_64=("https://github.com/ZL-Audio/ZLLimiter/releases/download/${pkgver}/ZL.Limiter-${pkgver}-Linux-x86-64-AVX2.zip")
source_aarch64=("https://github.com/ZL-Audio/ZLLimiter/releases/download/${pkgver}/ZL.Limiter-${pkgver}-Linux-arm64.zip")
sha256sums_x86_64=('f2c08aa7253674053c32a81cc810e020ddb85e91f4472f0040230c85d83f2d3b')
sha256sums_aarch64=('1d583e8b87f56688d2398c0222a3b0a3c75d9821b033ee1ebfbb776fbead2c84')

package_zl-limiter-vst3-bin() {
  groups+=('vst3-plugins')
  pkgdesc+=' (VST3 version)'
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r "${srcdir}"/VST3/* "${pkgdir}/usr/lib/vst3"
}

package_zl-limiter-lv2-bin() {
  groups+=('lv2-plugins')
  pkgdesc+=' (LV2 version)'
  mkdir -p "${pkgdir}/usr/lib/lv2/"
  cp -r "${srcdir}"/LV2/* "${pkgdir}/usr/lib/lv2"
}

package_zl-limiter-bin() {
  pkgdesc+=' (metapackage that requires all plugin formats)'
  depends+=('zl-limiter-vst3-bin' 'zl-limiter-lv2-bin')
}

# vim:set ts=2 sw=2 et:
