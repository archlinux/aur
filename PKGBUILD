pkgbase=tal-reverb4
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.4.0
pkgrel=2
arch=('x86_64')
url="https://tal-software.com/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-4_64_linux.zip')
md5sums=('5da6f0cc5b42d7a5d5f7523c16cbd40c')

package_tal-reverb4-vst() {
  pkgdesc="A Simple Algorithmic Reverb V4 By TAL Software (VST)"
  groups=('pro-audio' 'vst-plugins')
  mkdir -p $pkgdir/usr/lib/vst
  install -Dm755 ${srcdir}/libTAL-Reverb-4.so ${pkgdir}/usr/lib/vst/TAL-Reverb-4.so
}

package_tal-reverb4-vst3() {
  pkgdesc="A Simple Algorithmic Reverb V4 By TAL Software (VST3)"
  groups=('pro-audio' 'vst3-plugins')
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Reverb-4.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-4.vst3/Contents/x86_64-linux/TAL-Reverb-4.so
}
