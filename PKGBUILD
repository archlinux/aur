pkgbase=tal-drum
pkgname=("${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.1.3
pkgrel=2
arch=('x86_64')
url="https://tal-software.com/products/tal-drum"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=("TAL-DRUM-${pkgver}_64_Linux.zip"::'https://tal-software.com/downloads/plugins/TAL-Drum_64_linux.zip')
b2sums=('662964e72150665d03a0667db63e9616af2d32290d80cc2436a352cd7f755538b920f7b3ee86ce29724b15d1c72cfb4f27ea96126795bae2dbc184ef4938863d')

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
