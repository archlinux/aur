pkgbase=tal-filter2
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.1.0
pkgrel=7
groups=('pro-audio')
pkgdesc="A Filter By TAL Software V2"
arch=('x86_64')
url="https://tal-software.com/products/tal-filter"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
sha256sums=('b987c6fd5cc34ae441db93c753701dce049f2d12ab14e3890a4a3b52201b563f')

package_tal-filter2-vst-bin() {
  ## VST2 Plugin
  groups=("vst-plugins")
  replaces=("tal-chorus-filter2-bin")
  conflicts=("tal-chorus-filter2-bin")
  provides=("tal-chorus-filter2-vst-bin")
  install -Dm755 ${srcdir}/TAL-Filter-2/libTAL-Filter-2.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Filter-2.so
}

package_tal-filter2-vst3-bin() {
  ## VST3 Plugin
  groups=("vst3-plugins")
  replaces=("tal-chorus-filter2-bin")
  conflicts=("tal-chorus-filter2-bin")
  provides=("tal-chorus-filter2-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Filter-2/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}
