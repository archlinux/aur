pkgname=ctr-entropy-bin
pkgver=2.7.7
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/Entropy_II_-_Enhanced_Stereo_Delay"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings Entropy - Enhanced Stereo Delay (LV2(VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/entropy-LinuxLV2-64Bit.zip" "$srcdir/entropy-LinuxLV2-64Bit.zip"
	unzip "entropy-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/ctrecordings-entropy.LV2" "$pkgdir/usr/lib/lv2/ctrecordings-entropy.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/entropy-LinuxVST-64Bit.zip" "$srcdir/entropy-LinuxVST-64Bit.zip"
	unzip "entropy-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Entropy II.so" "$pkgdir/usr/lib/vst/Cut Through Recordings Entropy II.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/entropy-LinuxVST3-64Bit.zip" "$srcdir/entropy-LinuxVST3-64Bit.zip"
	unzip "entropy-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings Entropy II.vst3" "$pkgdir/usr/lib/vst3/Cut Through Recordings Entropy II.vst3"
}
