pkgname=ctr-popsoundshaper-bin
pkgver=1.7.2
pkgrel=1
arch=('x86_64')
url="https://www.cutthroughrecordings.com/product/POP_Sound_Shaper"
license=('EULA')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
pkgdesc="Cut Through Recordings Pop Sound Filter - Dynamic Filter (LV2/VST/VST3)"
groups=('lv2-plugins' 'pro-audio' 'vst-plugins' 'vst3-plugins')

package() {
	mkdir -p "$pkgdir/usr/lib"/{lv2,vst,vst3}

	## Install LV2
	ln -srf "`xdg-user-dir DOWNLOAD`/popss-LinuxLV2-64Bit.zip" "$srcdir/popss-LinuxLV2-64Bit.zip"
	unzip "popss-LinuxLV2-64Bit.zip"
	cp -r "$srcdir/POPSoundShaper.lv2" "$pkgdir/usr/lib/lv2/POPSoundShaper.lv2"

	## Install VST
	ln -srf "`xdg-user-dir DOWNLOAD`/popss-LinuxVST-64Bit.zip" "$srcdir/popss-LinuxVST-64Bit.zip"
	unzip "popss-LinuxVST-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings POP Sound Shaper.so" "$pkgdir/usr/lib/vst/Cut Through Recordings POP Sound Shaper.so"

	## Install VST3
	ln -srf "`xdg-user-dir DOWNLOAD`/popss-LinuxVST3-64Bit.zip" "$srcdir/popss-LinuxVST3-64Bit.zip"
	unzip "popss-LinuxVST3-64Bit.zip"
	install -Dm755 "$srcdir/Cut Through Recordings POP Sound Shaper.vst3" "$pkgdir/usr/lib/vst3/Cut Through Recordings POP Sound Shaper.vst3"
}
