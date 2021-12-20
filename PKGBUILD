pkgbase=tal-chorus-lx
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=1.6.0
pkgrel=1
arch=('x86_64')
url="https://tal-software.com/products/tal-chorus-lx"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://tal-software.com/downloads/plugins/Tal-Chorus-LX_64_linux.zip')
md5sums=('df5e26e04676c8b70fdbc4aa61fd6281')

package_tal-chorus-lx-vst() {
  pkgdesc="A Simple Algorithmic Chorus By TAL Software (VST)"
  groups=('pro-audio' 'vst-plugins')
  mkdir -p $pkgdir/usr/lib/vst
  install -Dm755 ${srcdir}/libTAL-Chorus-LX.so ${pkgdir}/usr/lib/vst/TAL-Chorus-LX.so
}

package_tal-chorus-lx-vst3() {
  pkgdesc="A Simple Algorithmic Chorus By TAL Software (VST3)"
  groups=('pro-audio' 'vst3-plugins')
  mkdir -p $pkgdir/usr/lib/vst3
  cp -r ${srcdir}/TAL-Chorus-LX.vst3 ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3
  chmod +x ${pkgdir}/usr/lib/vst3/TAL-Chorus-LX.vst3/Contents/x86_64-linux/TAL-Chorus-LX.so
}
