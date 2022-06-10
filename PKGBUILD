pkgbase=tal-drum
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=1.0.8
pkgrel=2
arch=('x86_64')
url="https://tal-software.com/products/tal-drum"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip')
md5sums=('c6c70683dabd72b44f567a27586e2b10')

package_tal-drum-vst() {
  pkgdesc="A Simple To Use Drum Sampler By TAL Software (VST)"
  groups=('pro-audio' 'vst-plugins')
  mkdir -p $pkgdir/usr/lib/vst
  install -Dm755 ${srcdir}/libTAL-Drum.so ${pkgdir}/usr/lib/vst/TAL-Drum.so
}

package_tal-drum-vst3() {
  pkgdesc="A Simple To Use Drum Sampler By TAL Software (VST)"
  groups=('pro-audio' 'vst3-plugins')
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Drum.vst3 ${pkgdir}/usr/lib/vst3/TAL-Drum.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Drum.vst3/Contents/x86_64-linux/TAL-Drum.so
}
