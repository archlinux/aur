pkgbase=tal-chorus-lx
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=1.6.3
pkgrel=7
pkgdesc='A simple algorithmic chorus by TAL Software'
arch=('x86_64')
url='https://tal-software.com/products/tal-chorus-lx'
license=('EULA')
groups=('pro-audio')
makedepends=('unzip')
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glibc'
)
source=('https://tal-software.com/downloads/plugins/TAL-Chorus-LX_64_linux.zip')
sha512sums=('82d707b07247c4d489c892bd3afcdbd97a15daf322fd7ca8e1cb74cd67fac021c2f00c2f6fd8f2efe33de0020b5d1b09956a6014d80b5188d54b377cc6b1f26c')
b2sums=('ea6066cfce6a3302a5003336aa67cff71d69078184c8fbf586f3a86640d8039bef01e7cbaa0cd655c33ff133fb36b171159cea0f4ca0fd4e2f8b5b4e09a8c393')

package_tal-chorus-lx-clap-bin() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  install -vDm644 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.clap ${pkgdir}/usr/lib/clap/TAL-Chorus-LX.clap
}

package_tal-chorus-lx-vst-bin() {
  pkgdesc+=' - VST plugin'
  groups+=('vst-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst-host'
  )

  install -vDm755 ${srcdir}/TAL-Chorus-LX/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Chorus-LX.so
}

package_tal-chorus-lx-vst3-bin() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  install -vDm755 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}
