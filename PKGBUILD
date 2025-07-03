pkgbase=aeolus-next
pkgname=( ${pkgbase}-{clap,lv2,standalone,vst3}-bin )
pkgver=0.3.0
pkgrel=1
url="https://github.com/Archie3d/aeolus_plugin"
license=('GPL')
arch=('x86_64')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'pcre2')
provides=("aeolus-vst3")
options=(!strip)
source=("${url}/releases/download/v${pkgver}/Aeolus-clap-linux-${pkgver}.zip"
		"${url}/releases/download/v${pkgver}/Aeolus-lv2-linux-${pkgver}.zip"
		"${url}/releases/download/v${pkgver}/Aeolus-standalone-linux-${pkgver}.zip"
		"${url}/releases/download/v${pkgver}/Aeolus-vst3-linux-${pkgver}.zip"
		"aeolus-next.png"
		"Aeolus Next.desktop")
sha256sums=('498170149337c7d2ce19783156522d3bf489f811c2a61b7323b64071882cc370'
            'dad29d9b6a20a1e13364bd6cffd66a1bb20f2319842cc818d44ae3d89f8ae06c'
            'f2a16cf6b4c0d3997893fd7f20e9d9508473a94abbb0970d8da5eda6e614ca4f'
            '1746f87c18d705c42e9a878467d436f97e007b4312bae92910cf0da91e262670'
            '4d2df74407d2f2fd7489bc8cd22d3fb644cdc16f4ac6a52eae1ec26ac0666417'
            '84457ab146c11fa03f53a6924495c15d2df276d4a60d7fa0320596b3611c16d3')

package_aeolus-next-clap-bin() {
	# Install CLAP Plugin
	groups=('pro-audio' 'clap-plugins')
	pkgdesc="Aeolus Organ Synth NEXT (CLAP)"
	install -Dm755 "$srcdir/Aeolus.clap" "$pkgdir/usr/lib/clap/Aeolus.clap"
}

package_aeolus-next-lv2-bin() {
	# Install LV2 Plugin
	groups=('pro-audio' 'lv2-plugins')
	pkgdesc="Aeolus Organ Synth NEXT (LV2)"
	install -Dm755 "$srcdir/Aeolus.lv2/libAeolus.so" "$pkgdir/usr/lib/lv2/Aeolus.lv2/libAeolus.so"
	install -Dm755 "$srcdir/Aeolus.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Aeolus.lv2/dsp.ttl"
	install -Dm755 "$srcdir/Aeolus.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Aeolus.lv2/manifest.ttl"
	install -Dm755 "$srcdir/Aeolus.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Aeolus.lv2/ui.ttl"
}

package_aeolus-next-standalone-bin() {
	# Install Standalone App
	groups=('pro-audio')
	pkgdesc="Aeolus Organ Synth NEXT (Standalone)"
	install -Dm755 "$srcdir/Aeolus" "$pkgdir/usr/bin/Aeolus Next"
	install -Dm644 "$srcdir/aeolus-next.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/aeolus-next.png"
	install -Dm644 "$srcdir/Aeolus Next.desktop" "$pkgdir/usr/share/applications/Aeolus Next.desktop"
}

package_aeolus-next-vst3-bin() {
	# Install VST3 Plugin
	groups=('pro-audio' 'vst3-plugins')
	pkgdesc="Aeolus Organ Synth NEXT (VST3)"
	install -Dm755 "$srcdir/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so" "$pkgdir/usr/lib/vst3/Aeolus.vst3/Contents/x86_64-linux/Aeolus.so"
	install -Dm755 "$srcdir/Aeolus.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Aeolus.vst3/Contents/Resources/moduleinfo.json"
}
