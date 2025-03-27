pkgbase=tal-filter2
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.1.0
pkgrel=12
pkgdesc='A filter V2 by TAL Software'
arch=('x86_64')
url='https://tal-software.com/products/tal-filter'
license=('EULA')
groups=('pro-audio')
makedepends=('unzip')
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glibc'
)
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
sha512sums=('9dc6bad274fcd13660fe7857f36673a4ec081fb14deaffa3c7db6df73e3da647bff4a174e37cf618d54064de4c619d05882a3a05928221d1746d017e67785944')
b2sums=('937257fb359d3dc1c842f260b8486d8f0d0819ace846464906b6bf4cac6da3d09024667d44a909312f92e5512d06c6fca0c61b024d69c32e30002f9622b61df5')

package_tal-filter2-clap-bin() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  install -vDm644 ${srcdir}/TAL-Filter-2/TAL-Filter-2.clap ${pkgdir}/usr/lib/clap/TAL-Filter-2.clap
}

package_tal-filter2-vst-bin() {
  pkgdesc+=' - VST plugin'
  groups+=('vst-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst-host'
  )

  install -vDm755 ${srcdir}/TAL-Filter-2/libTAL-Filter-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Filter-2.so
}

package_tal-filter2-vst3-bin() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  install -vDm755 ${srcdir}/TAL-Filter-2/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}
