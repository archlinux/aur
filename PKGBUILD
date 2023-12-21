pkgbase=tal-filter
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.6.0
pkgrel=6
arch=('x86_64')
groups=('pro-audio''vst-plugins' 'vst3-plugins')
pkgdesc="A Filter By TAL Software"
url="https://tal-software.com/products/tal-filter"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Filter_64_linux.zip')
md5sums=('5239a5518007008755ced72c4e83510c')

package_tal-filter-vst-bin() {
  ## VST2 Plugin
  replaces=("tal-chorus-filter-bin")
  conflicts=("tal-chorus-filter-bin")
  provides=("tal-chorus-filter-vst-bin")
  install -Dm755 ${srcdir}/libTAL-Filter.so ${pkgdir}/usr/lib/vst/TAL\ Software/libTAL-Filter.so
}

package_tal-filter-vst3-bin() {
  ## VST3 Plugin
  replaces=("tal-chorus-filter-bin")
  conflicts=("tal-chorus-filter-bin")
  provides=("tal-chorus-filter-vst3-bin")
  install -Dm755 ${srcdir}/TAL-Filter.vst3/Contents/x86_64-linux/TAL-Filter.so ${pkgdir}/usr/lib/vst3/TAL\ Software/TAL-Filter.vst3/Contents/x86_64-linux/TAL-Filter.so
}
