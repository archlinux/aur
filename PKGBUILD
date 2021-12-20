pkgbase=ctr-m4compressor
pkgname=("${pkgbase}-lv2" "${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=2.0.7
pkgrel=2
arch=('x86_64')
url="https://www.cutthroughrecordings.com/downloads"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

package_ctr-m4compressor-lv2() {
	pkgdesc="Cut Through Recordings M4Compressor - Multiband Compressor (LV2)"
	groups=('lv2-plugins' 'pro-audio')
	mkdir -p $pkgdir/usr/lib/lv2
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxLV2-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxLV2-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxLV2-64Bit.zip
	cp -r $srcdir/ctrecordings-${pkgbase/ctr-/}.LV2 $pkgdir/usr/lib/lv2/ctrecordings-${pkgbase/ctr-/}.lv2
}

package_ctr-m4compressor-vst() {
	pkgdesc="Cut Through Recordings M4Compressor - Multiband Compressor (VST)"
	groups=('pro-audio' 'vst-plugins')
	mkdir -p $pkgdir/usr/lib/vst
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxVST-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxVST-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxVST-64Bit.zip
	install -Dm755 $srcdir/CTR\ M4\ Multiband\ Compressor.so $pkgdir/usr/lib/vst/CTR\ M4\ Multiband\ Compressor.so
}

package_ctr-m4compressor-vst3() {
	pkgdesc="Cut Through Recordings M4Compressor - Multiband Compressor (VST3)"
	groups=('pro-audio' 'vst3-plugins')
	mkdir -p $pkgdir/usr/lib/vst3
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxVST3-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxVST3-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxVST3-64Bit.zip
	install -Dm755 $srcdir/CTR\ M4\ Multiband\ Compressor.vst3 $pkgdir/usr/lib/vst3/CTR\ M4\ Multiband\ Compressor.vst3
}
