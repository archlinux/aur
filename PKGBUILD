pkgbase=tal-filter2
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=3.1.0
pkgrel=4
arch=('x86_64')
url="https://tal-software.com/products/tal-filter"
license=('EULA')
source=('https://tal-software.com/downloads/plugins/TAL-Filter-2_64_linux.zip')
md5sums=('b1285c7075d468a04f8f8803cceaaa22')

package_tal-filter2-vst() {
  groups=('pro-audio''vst-plugins')
  pkgdesc="A Filter By TAL Software V2 (VST)"
  install -Dm755 ${srcdir}/libTAL-Filter-2.so ${pkgdir}/usr/lib/vst/libTAL-Filter-2.so
}

package_tal-filter2-vst3() {
  groups=('pro-audio' 'vst3-plugins')
  pkgdesc="A Filter By TAL Software V2 (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Filter-2.vst3 ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Filter-2.vst3/Contents/x86_64-linux/TAL-Filter-2.so
}
