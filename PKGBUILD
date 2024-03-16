pkgbase=tal-reverb4
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=4.0.4
pkgrel=3
arch=('x86_64')
pkgdesc="A Simple Algorithmic Reverb V4 By TAL Software"
url="https://tal-software.com/tal-reverb-4"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('8b38e6e18add8f8754847c0e27736c7f')

package_tal-reverb4-clap-bin() {
  ## CLAP Plugin
  groups=("clap-plugins" 'pro-audio')
  replaces=("tal-reverb4-bin")
  conflicts=("tal-reverb4-bin")
  provides=("tal-reverb4-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.clap ${pkgdir}/usr/lib/clap/TAL-Reverb-4.clap
}

package_tal-reverb4-vst-bin() {
  ## VST2 Plugin
  groups=('pro-audio' "vst-plugins")
  replaces=("tal-reverb4-bin")
  conflicts=("tal-reverb4-bin")
  provides=("tal-reverb4-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Reverb-4/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-4.so
}

package_tal-reverb4-vst3-bin() {
  ## VST3 Plugin
  groups=('pro-audio' "vst3-plugins")
  replaces=("tal-reverb4-bin")
  conflicts=("tal-reverb4-bin")
  provides=("tal-reverb4-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}
