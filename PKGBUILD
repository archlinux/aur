pkgbase=ctr-convergence
pkgname=("${pkgbase}-lv2" "${pkgbase}-vst" "${pkgbase}-vst3")
pkgver=1.1.2
pkgrel=2
arch=('x86_64')
url="https://www.cutthroughrecordings.com/downloads"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

package_ctr-convergence-lv2() {
	pkgdesc="Cut Through Recordings Convergence - Dynamic Compressor (LV2)"
	groups=('lv2-plugins' 'pro-audio')
	mkdir -p $pkgdir/usr/lib/lv2
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxLV2-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxLV2-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxLV2-64Bit.zip
	cp -r $srcdir/ctrecordings-${pkgbase/ctr-/}.LV2 $pkgdir/usr/lib/lv2/ctrecordings-${pkgbase/ctr-/}.lv2
}

package_ctr-convergence-vst() {
	pkgdesc="Cut Through Recordings Convergence - Dynamic Compressor (VST)"
	groups=('pro-audio' 'vst-plugins')
	mkdir -p $pkgdir/usr/lib/vst
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxVST-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxVST-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxVST-64Bit.zip
	install -Dm755 $srcdir/Cut\ Through\ Recordings\ Convergence.so $pkgdir/usr/lib/vst/Cut\ Through\ Recordings\ Convergence.so
}

package_ctr-convergence-vst3() {
	pkgdesc="Cut Through Recordings Convergence - Dynamic Compressor (VST3)"
	groups=('pro-audio' 'vst3-plugins')
	mkdir -p $pkgdir/usr/lib/vst3
	ln -srf `xdg-user-dir DOWNLOAD`/${pkgbase/ctr-/}-LinuxVST3-64Bit.zip $srcdir/${pkgbase/ctr-/}-LinuxVST3-64Bit.zip
	unzip ${pkgbase/ctr-/}-LinuxVST3-64Bit.zip
	install -Dm755 $srcdir/Cut\ Through\ Recordings\ Convergence.vst3 $pkgdir/usr/lib/vst3/Cut\ Through\ Recordings\ Convergence.vst3
}
