pkgname=ctr-convergence-bin
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/Convergence/"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings Convergence - Dynamic Compressor (LV2/VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/convergence-LinuxLV2-64Bit.zip" "$srcdir/convergence-LinuxLV2-64Bit.zip"
	unzip "convergence-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/ctrecordings-convergence.LV2" "$pkgdir/usr/lib/lv2/ctrecordings-convergence.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/convergence-LinuxVST-64Bit.zip" "$srcdir/convergence-LinuxVST-64Bit.zip"
	unzip "convergence-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Convergence.so" "$pkgdir/usr/lib/vst/Cut Through Recordings Convergence.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/convergence-LinuxVST3-64Bit.zip" "$srcdir/convergence-LinuxVST3-64Bit.zip"
	unzip "convergence-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Convergence.vst3" "$pkgdir/usr/lib/vst3/Cut Through Recordings Convergence.vst3"
}
