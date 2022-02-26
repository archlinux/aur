pkgname=ctr-faradelay-bin
pkgver=1.3.7
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/Faradelay"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings Faradelay - Dynamic Filter/Delay (LV2/VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/faradelay-LinuxLV2-64Bit.zip" "$srcdir/faradelay-LinuxLV2-64Bit.zip"
	unzip "faradelay-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/ctrecordings-faradelay.LV2" "$pkgdir/usr/lib/lv2/ctrecordings-faradelay.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/faradelay-LinuxVST-64Bit.zip" "$srcdir/faradelay-LinuxVST-64Bit.zip"
	unzip "faradelay-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Faradelay.so" "$pkgdir/usr/lib/vst/Cut Through Recordings Faradelay.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/faradelay-LinuxVST3-64Bit.zip" "$srcdir/faradelay-LinuxVST3-64Bit.zip"
	unzip "faradelay-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Faradelay.vst3" "$pkgdir/usr/lib/vst3/Cut Through Recordings Faradelay.vst3"
}
