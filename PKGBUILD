pkgbase=tal-vocoder
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.0.3
pkgrel=6
pkgdesc='A phase vocoder by TAL Software'
arch=('x86_64')
url='https://tal-software.com/products/tal-vocoder'
license=('EULA')
groups=('pro-audio')
makedepends=('unzip')
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glibc'
)
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
sha512sums=('8249458b219a0f4c0980760fd60efb2ca6b46f699d7fac5c939e11867210529d3ac3d7e5916800c4b0623abcf6b4dbde7eac1a2d373e966161afc4c28bb3c011')
b2sums=('327f4cedb4f8d55479ffc3855e9396001419b54edb2c655cbb7432f1806b5062512c4e9fb9f6cfe4561e0cffb2a6216768c69e419057e8fb8251ea7279f090a8')

package_tal-vocoder-clap-bin() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  install -vDm644 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.clap ${pkgdir}/usr/lib/clap/TAL-Vocoder-2.clap
}

package_tal-vocoder-vst-bin() {
  pkgdesc+=' - VST plugin'
  groups+=('vst-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst-host'
  )

  install -vDm755 ${srcdir}/TAL-Vocoder-2/libTAL-Vocoder-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Vocoder-2.so
}

package_tal-vocoder-vst3-bin() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  install -vDm755 ${srcdir}/TAL-Vocoder-2/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so
}
