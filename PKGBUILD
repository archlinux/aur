pkgbase=tal-reverb3
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.3.0
pkgrel=4
arch=('x86_64')
url="https://tal-software.com/products/tal-reverb-4"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/TAL-Reverb-3_64_linux.zip')
md5sums=('fc584bf672bd98ed07226a86b7aef303')

package_tal-reverb3-vst() {
  groups=('pro-audio''vst-plugins')
  pkgdesc="A Simple Algorithmic Reverb V3 By TAL Software (VST)"
  install -Dm755 ${srcdir}/libTAL-Reverb-3.so ${pkgdir}/usr/lib/vst/libTAL-Reverb-3.so
}

package_tal-reverb3-vst3() {
  groups=('pro-audio' 'vst3-plugins')
  pkgdesc="A Simple Algorithmic Reverb V3 By TAL Software (VST3)"
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Reverb-3.vst3 ${pkgdir}/usr/lib/vst3/TAL-Reverb-3.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Reverb-3.vst3/Contents/x86_64-linux/TAL-Reverb-3.so
}
