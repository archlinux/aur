pkgbase=tal-noisemaker-bin
pkgname=("${pkgbase/-bin}-clap-bin" "${pkgbase/-bin}-vst-bin" "${pkgbase/-bin}-vst3-bin")
pkgver=5.0.6
pkgrel=2
arch=('x86_64')
pkgdesc="A Free Soft Synth By TAL Software"
url="https://tal-software.com/products/tal-noisemaker"
license=('EULA')
provides=("$pkgbase")
conflicts=("$pkgbase")
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
sha256sums=('328565e646f98f14dd931a33fa438a4c9eddc451e759b92d1005f4336fa3fd20')

package_tal-noisemaker-clap-bin() {
  ## CLAP Plugin
  groups=("clap-plugins" 'pro-audio')
  replaces=("tal-noisemaker-bin")
  conflicts=("tal-noisemaker-bin")
  provides=("tal-noisemaker-clap-bin")
  install -Dm755 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.clap ${pkgdir}/usr/lib/clap/TAL-NoiseMaker.clap
}

package_tal-noisemaker-vst-bin() {
  ## VST2 Plugin
  groups=('pro-audio' "vst-plugins")
  replaces=("tal-noisemaker-bin")
  conflicts=("tal-noisemaker-bin")
  provides=("tal-noisemaker-vst-bin")
  install -Dm755 ${srcdir}/TAL-NoiseMaker/libTAL-NoiseMaker.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-NoiseMaker.so
}

package_tal-noisemaker-vst3-bin() {
  ## VST3 Plugin
  groups=('pro-audio' "vst3-plugins")
  replaces=("tal-noisemaker-bin")
  conflicts=("tal-noisemaker-bin")
  provides=("tal-noisemaker-vst3-bin")
  install -Dm755 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so
}
