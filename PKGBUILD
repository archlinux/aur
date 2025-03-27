pkgbase=tal-reverb4
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=4.0.4
pkgrel=6
pkgdesc='A simple algorithmic reverb V4 by TAL Software'
arch=('x86_64')
url='https://tal-software.com/tal-reverb-4'
license=('EULA')
groups=('pro-audio')
makedepends=('unzip')
_common_depends=(
	'freetype2'
	'gcc-libs'
	'glibc'
)
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
sha512sums=('eeebc59d286901f60c55bae150c38669195ddda3e56a63aae92db955578f2f1cbd38abaae75cab0501e1f2d4e7890fbe11acb0452dd3880cb66b9c6cb889f1bb')
b2sums=('85d8142955fb9cc07c54007e2cf89a659d9409fe12fed964e72eb1981d820419db354d812d32426867522aebb73835c05530df6e4eca78a99f7268991f9acb9f')

package_tal-reverb4-clap-bin() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )

  install -vDm644 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.clap ${pkgdir}/usr/lib/clap/TAL-Reverb-4.clap
}

package_tal-reverb4-vst-bin() {
  pkgdesc+=' - VST plugin'
  groups+=('vst-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst-host'
  )

  install -vDm755 ${srcdir}/TAL-Reverb-4/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Reverb-4.so
}

package_tal-reverb4-vst3-bin() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  install -vDm755 ${srcdir}/TAL-Reverb-4/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}
