pkgname=ctr-epicpress-bin
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/EpicPRESS"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings Epicpress - Enhanced Dynamic Compressor (LV2/VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/epicpress-LinuxLV2-64Bit.zip" "$srcdir/epicpress-LinuxLV2-64Bit.zip"
	unzip "epicpress-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/ctrecordings-epicpress.LV2" "$pkgdir/usr/lib/lv2/ctrecordings-epicpress.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/epicpress-LinuxVST-64Bit.zip" "$srcdir/epicpress-LinuxVST-64Bit.zip"
	unzip "epicpress-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings EpicPRESS.so" "$pkgdir/usr/lib/vst/Cut Through Recordings EpicPRESS.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/epicpress-LinuxVST3-64Bit.zip" "$srcdir/epicpress-LinuxVST3-64Bit.zip"
	unzip "epicpress-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings EpicPRESS.vst3" "$pkgdir/usr/lib/vst3/Cut Through Recordings EpicPRESS.vst3"
}
