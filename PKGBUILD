pkgbase=ctr-popsoundshaper
pkgname=("${pkgbase}-lv2" "${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=1.7.2
pkgrel=2
arch=('x86_64')
url="https://www.cutthroughrecordings.com/downloads"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

package_ctr-popsoundshaper-lv2() {
	pkgdesc="Cut Through Recordings Pop Sound Filter - Dynamic Filter (LV2)"
	groups=('lv2-plugins' 'pro-audio')
	mkdir -p $pkgdir/usr/lib/lv2
	ln -srf `xdg-user-dir DOWNLOAD`/popss-LinuxLV2-64Bit.zip $srcdir/popss-LinuxLV2-64Bit.zip
	unzip popss-LinuxLV2-64Bit.zip
	cp -r $srcdir/POPSoundShaper.lv2 $pkgdir/usr/lib/lv2/POPSoundShaper.lv2
}

package_ctr-popsoundshaper-vst() {
	pkgdesc="Cut Through Recordings Pop Sound Filter - Dynamic Filter (VST)"
	groups=('pro-audio' 'vst-plugins')
	mkdir -p $pkgdir/usr/lib/vst
	ln -srf `xdg-user-dir DOWNLOAD`/popss-LinuxVST-64Bit.zip $srcdir/popss-LinuxVST-64Bit.zip
	unzip popss-LinuxVST-64Bit.zip
	install -Dm755 $srcdir/Cut\ Through\ Recordings\ POP\ Sound\ Shaper.so $pkgdir/usr/lib/vst/Cut\ Through\ Recordings\ POP\ Sound\ Shaper.so
}

package_ctr-popsoundshaper-vst3() {
	pkgdesc="Cut Through Recordings Pop Sound Filter - Dynamic Filter (VST3)"
	groups=('pro-audio' 'vst3-plugins')
	mkdir -p $pkgdir/usr/lib/vst3
	ln -srf `xdg-user-dir DOWNLOAD`/popss-LinuxVST3-64Bit.zip $srcdir/popss-LinuxVST3-64Bit.zip
	unzip popss-LinuxVST3-64Bit.zip
	install -Dm755 $srcdir/Cut\ Through\ Recordings\ POP\ Sound\ Shaper.vst3 $pkgdir/usr/lib/vst3/Cut\ Through\ Recordings\ POP\ Sound\ Shaper.vst3
}
