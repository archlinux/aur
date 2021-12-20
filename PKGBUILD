pkgbase=tal-vocoder
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.2.0
pkgrel=3
arch=('x86_64')
url="https://tal-software.com/products/tal-vocoder"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Vocoder-2_64_linux.zip')
md5sums=('ad70ad7a038e4adc57e12f3bf03cb5d8')

package_tal-vocoder-vst() {
  groups=('pro-audio''vst-plugins')
  conflicts=("distrho-ports")
  replaces=("distrho-ports")
  pkgdesc="A Phase Vocoder By TAL Software (VST)"
  mkdir -p $pkgdir/usr/lib/vst
  cp -r ${srcdir}/libTAL-Vocoder-2.so ${pkgdir}/usr/lib/vst/TAL-Vocoder-2.so
  chmod +x ${pkgdir}/usr/lib/vst/TAL-Vocoder-2.so
}

package_tal-vocoder-vst3() {
  groups=('pro-audio''vst-plugins')
  pkgdesc="A Phase Vocoder By TAL Software (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Vocoder-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Vocoder-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Vocoder-2.vst3/Contents/x86_64-linux/TAL-Vocoder-2.so
}
