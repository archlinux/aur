pkgbase=tal-chorus-lx
pkgname=("${pkgbase}-clap-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=1.6.3
pkgrel=2
arch=('x86_64')
pkgdesc="A Simple Algorithmic Chorus By TAL Software"
groups=('pro-audio')
url="https://tal-software.com/products/tal-chorus-lx"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
sha256sums=('176396c83a3f43d3ec0ae0b1483c2ef7b9480952699cc999f393993fba786a0e')

package_tal-chorus-lx-clap-bin() {
  ## CLAP Plugin
  groups=("clap-plugins")
  replaces=("tal-chorus-lx-bin")
  conflicts=("tal-chorus-lx-bin")
  provides=("tal-chorus-lx-clap-bin")
  install -Dm755 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.clap ${pkgdir}/usr/lib/clap/TAL-Chorus-LX.clap
}
package_tal-chorus-lx-vst-bin() {
  ## VST2 Plugin
  groups=("vst-plugins")
  replaces=("tal-chorus-lx-bin")
  conflicts=("tal-chorus-lx-bin")
  provides=("tal-chorus-lx-vst-bin")
  install -Dm755 ${srcdir}/TAL-Chorus-LX/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Chorus-LX.so
}
package_tal-chorus-lx-vst3-bin() {
  ## VST3 Plugin
  groups=("vst3-plugins")
  replaces=("tal-chorus-lx-bin")
  conflicts=("tal-chorus-lx-bin")
  provides=("tal-chorus-lx-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Chorus-LX/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}
