pkgbase=harrison-ava
pkgname=("${pkgbase}-bf-vst" "${pkgbase}-ds-vst" "${pkgbase}-legacyq-vst" "${pkgbase}-mc-vst" "${pkgbase}-me-vst" "${pkgbase}-sc-vst" "${pkgbase}-df-vst" "${pkgbase}-vf-vst")
pkgver=$(date +%Y%m%d)
pkgrel=2
arch=('x86_64')
url="https://www.harrisonconsoles.com/site/ava-plugins.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AVA Plugins Archive
	_archive="`xdg-user-dir DOWNLOAD`/Harrison-AVA-linux-64bit.tar.gz"
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	tar -xvzf "$srcdir/`basename ${_archive}`"
}

package_harrison-ava-bf-vst() {
	pkgdesc="AVA Bass Flow (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-BF.so" "$pkgdir/usr/lib/vst/AVA-BF.so"
}

package_harrison-ava-ds-vst() {
	pkgdesc="AVA De-Esser (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-DS.so" "$pkgdir/usr/lib/vst/AVA-DS.so"
}

package_harrison-ava-legacyq-vst() {
	pkgdesc="AVA LegacyQ (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-LegacyQ.so" "$pkgdir/usr/lib/vst/AVA-LegacyQ.so"
}

package_harrison-ava-mc-vst() {
	pkgdesc="AVA Multiband Compressor (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-MC.so" "$pkgdir/usr/lib/vst/AVA-MC.so"
}

package_harrison-ava-me-vst() {
	pkgdesc="AVA Multiband Equalizer (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-ME.so" "$pkgdir/usr/lib/vst/AVA-ME.so"
}

package_harrison-ava-sc-vst() {
	pkgdesc="AVA Spectral Compressor (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-SC.so" "$pkgdir/usr/lib/vst/AVA-SC.so"
}

package_harrison-ava-df-vst() {
	pkgdesc="AVA Drum Flow (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-DF.so" "$pkgdir/usr/lib/vst/AVA-DF.so"
}

package_harrison-ava-vf-vst() {
	pkgdesc="AVA Vocal Flow (VST)"
	install -Dm755 "$srcdir/Harrison_AVA/vst/AVA-VF.so" "$pkgdir/usr/lib/vst/AVA-VF.so"
}
