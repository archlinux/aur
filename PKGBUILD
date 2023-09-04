pkgbase=tal-drum
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
url="https://tal-software.com/products/tal-drum"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip')
md5sums=('09715efe0a0de7c25670e352b8389bcd')

package_tal-drum-vst() {
  pkgdesc="A Simple To Use Drum Sampler By TAL Software (VST)"
  groups=('pro-audio' 'vst-plugins')
  mkdir -p ${pkgdir}/usr/lib/vst
  install -Dm755 ${srcdir}/TAL-Drum/libTAL-Drum.so ${pkgdir}/usr/lib/vst/TAL-Drum.so
}

package_tal-drum-vst3() {
  pkgdesc="A Simple To Use Drum Sampler By TAL Software (VST)"
  groups=('pro-audio' 'vst3-plugins')
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Drum/TAL-Drum.vst3 ${pkgdir}/usr/lib/vst3/TAL-Drum.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Drum.vst3/Contents/x86_64-linux/TAL-Drum.so
}
