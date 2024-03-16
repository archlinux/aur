pkgbase=aeolus-next
pkgname=("${pkgbase}-standalone-bin" "${pkgbase}-vst3-bin")
pkgver=0.2.0
pkgrel=3
url="https://github.com/Archie3d/aeolus_plugin"
license=('GPL')
arch=('x86_64')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
makedepends=('unzip')
provides=("aeolus-vst3")
options=(!strip)
source=("https://github.com/Archie3d/aeolus_plugin/releases/download/v${pkgver}/Aeolus-standalone-vst3-linux-${pkgver}.zip"
		"aeolus-next.png"
		"Aeolus Next.desktop")
sha256sums=('fd0f8c0a7a6112ac68412301979ad934cd97afa03adbaee29a39875097a3ad06'
			'4d2df74407d2f2fd7489bc8cd22d3fb644cdc16f4ac6a52eae1ec26ac0666417'
			'84457ab146c11fa03f53a6924495c15d2df276d4a60d7fa0320596b3611c16d3')

package_aeolus-next-standalone-bin() {
	# Install Standalone App
	groups=('pro-audio')
	pkgdesc="Aeolus Organ Synth NEXT (Standalone)"
	install -Dm755 "$srcdir/Standalone/Aeolus" "$pkgdir/usr/bin/Aeolus Next"
	install -Dm644 "$srcdir/aeolus-next.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/aeolus-next.png"
	install -Dm644 "$srcdir/Aeolus Next.desktop" "$pkgdir/usr/share/applications/Aeolus Next.desktop"
}

package_aeolus-next-vst3-bin() {
	# Install VST3 Plugin
	groups=('pro-audio' 'vst3-plugins')
	pkgdesc="Aeolus Organ Synth NEXT (VST3)"
	install -Dm755 "$srcdir/VST3/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so" "$pkgdir/usr/lib/vst3/Aeolus.vst3/Contents/x86_64-linux/Aeolus Next.so"
}
