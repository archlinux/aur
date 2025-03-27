pkgbase=tal-noisemaker-bin
pkgname=("${pkgbase/-bin}-clap-bin" "${pkgbase/-bin}-vst-bin" "${pkgbase/-bin}-vst3-bin")
pkgver=5.0.6
pkgrel=6
pkgdesc='A free soft synth by TAL Software'
arch=('x86_64')
url='https://tal-software.com/products/tal-noisemaker'
license=('EULA')
groups=('pro-audio')
replaces=('tal-noisemaker')
makedepends=('unzip')
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glibc'
)
source=('https://tal-software.com/downloads/plugins/TAL-NoiseMaker_64_linux.zip')
sha512sums=('2387236eee7d374f37a19475c2473396f51a142b4d6b87983a871cdea754a1146bf1c9d3c2c5a8993cd07afc8e2f29675f9cc9ecd40405ab4c36b3d3c19503c4')
b2sums=('12f92dd9c87c99c3d22787da532c6648d193d33c18d92b7909f4f604c772108ac7d9676f5d8efa73c8c9eebb8467953cc6218ed2f03f7e0f209bc3fb65055c2f')

package_tal-noisemaker-clap-bin() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  install -vDm644 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.clap ${pkgdir}/usr/lib/clap/TAL-NoiseMaker.clap
}

package_tal-noisemaker-vst-bin() {
  pkgdesc+=' - VST plugin'
  groups+=('vst-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst-host'
  )

  install -vDm755 ${srcdir}/TAL-NoiseMaker/libTAL-NoiseMaker.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-NoiseMaker.so
}

package_tal-noisemaker-vst3-bin() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  install -vDm755 ${srcdir}/TAL-NoiseMaker/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-NoiseMaker.vst3/Contents/x86_64-linux/TAL-NoiseMaker.so
}
