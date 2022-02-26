pkgname=ctr-m4compressor-bin
pkgver=2.0.7
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/M4_Multiband_Compressor"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings M4Compressor - Multiband Compressor (LV2/VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/m4compressor-LinuxLV2-64Bit.zip" "$srcdir/m4compressor-LinuxLV2-64Bit.zip"
	unzip "m4compressor-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/ctrecordings-m4compressor.LV2" "$pkgdir/usr/lib/lv2/ctrecordings-m4compressor.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/m4compressor-LinuxVST-64Bit.zip" "$srcdir/m4compressor-LinuxVST-64Bit.zip"
	unzip "m4compressor-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/CTR M4 Multiband Compressor.so" "$pkgdir/usr/lib/vst/CTR M4 Multiband Compressor.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/m4compressor-LinuxVST3-64Bit.zip" "$srcdir/m4compressor-LinuxVST3-64Bit.zip"
	unzip "m4compressor-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/CTR M4 Multiband Compressor.vst3" "$pkgdir/usr/lib/vst3/CTR M4 Multiband Compressor.vst3"
}
