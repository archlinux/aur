# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase='zl-limiter-bin'
pkgname=('zl-limiter-vst3-bin' 'zl-limiter-lv2-bin' 'zl-limiter-bin')
pkgver='0.1.0'
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
sha256sums_x86_64=('1fe0667b5df47be32f490009860e2a1a506bce2fd8af497876c766b12cc19733')
sha256sums_aarch64=('10d3404640eb9baa0bce5b89552e4589f63bb460b834373b663be9f4f6187f69')

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
