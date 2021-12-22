pkgbase=tal-filter
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.6.0
pkgrel=4
arch=('x86_64')
url="https://tal-software.com/products/tal-filter"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Filter_64_linux.zip')
md5sums=('5239a5518007008755ced72c4e83510c')

package_tal-filter-vst() {
  groups=('pro-audio''vst-plugins')
  pkgdesc="A Filter By TAL Software (VST)"
  install -Dm755 ${srcdir}/libTAL-Filter.so ${pkgdir}/usr/lib/vst/libTAL-Filter.so
}

package_tal-filter-vst3() {
  groups=('pro-audio''vst3-plugins')
  pkgdesc="A Filter By TAL Software (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Filter.vst3 ${pkgdir}/usr/lib/vst3/TAL-Filter.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Filter.vst3/Contents/x86_64-linux/TAL-Filter.so
}
