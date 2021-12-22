pkgbase=tal-noisemaker
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=5.0.4
pkgrel=4
arch=('x86_64')
url="https://tal-software.com/products/tal-noisemaker"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
md5sums=('e2ab5f4553642ceea796ce2895fd3c47')

package_tal-noisemaker-vst() {
  groups=('pro-audio''vst-plugins')
  pkgdesc="A Free Soft Synth By TAL Software (VST)"
  install -Dm755 ${srcdir}/libTAL-NoiseMaker.so ${pkgdir}/usr/lib/vst/libTAL-NoiseMaker.so
}

package_tal-noisemaker-vst3() {
  groups=('pro-audio' 'vst3-plugins')
  pkgdesc="A Free Soft Synth By TAL Software (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-NoiseMaker.vst3 ${pkgdir}/usr/lib/vst3/TAL-NoiseMaker.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so
}
