pkgbase=tal-vocoder
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.0.3
pkgrel=2
arch=('x86_64')
groups=('pro-audio')
pkgdesc="A Phase Vocoder By TAL Software"
url="https://tal-software.com/products/tal-vocoder"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
md5sums=('1f0e553b20c7d04da55a76c224667372')

package_tal-vocoder-clap-bin() {
  ## CLAP Plugin
  groups=("clap-plugins")
  replaces=("tal-vocoder-bin")
  conflicts=("tal-vocoder-bin")
  provides=("tal-vocoder-clap-bin")
  install -Dm755 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.clap ${pkgdir}/usr/lib/clap/TAL-Vocoder-2.clap
}

package_tal-vocoder-vst-bin() {
  ## VST2 Plugin
  groups=("vst-plugins")
  replaces=("tal-vocoder-bin")
  conflicts=("tal-vocoder-bin")
  provides=("tal-vocoder-vst-bin")
  install -Dm755 ${srcdir}/TAL-Vocoder-2/libTAL-Vocoder-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Vocoder-2.so
}

package_tal-vocoder-vst3-bin() {
  ## VST3 Plugin
  groups=("vst3-plugins")
  replaces=("tal-vocoder-bin")
  conflicts=("tal-vocoder-bin")
  provides=("tal-vocoder-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so
}
