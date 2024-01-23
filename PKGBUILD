pkgbase=socalabs-wavetable
pkgname=("${pkgbase}-lv2-bin" "${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=1.0.19
pkgrel=1
arch=('x86_64')
url="https://socalabs.com/synths/wavetable/"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("${pkgbase}.zip::https://socalabs.com/files/get.php?id=Wavetable_Linux.zip")
sha256sums=('9286baa304c078a5adc5b61ed3b577baa7c10b8d597db6d49f696339c7d5f6a8')

package_socalabs-wavetable-lv2-bin() {
	pkgdesc="Socalabs Retro Wavetable Synth (LV2)"
	groups=('lv2-plugins')
	install -Dm644 "$srcdir/Wavetable.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Wavetable.lv2/dsp.ttl"
	install -Dm755 "$srcdir/Wavetable.lv2/libWavetable.so" "$pkgdir/usr/lib/lv2/Wavetable.lv2/libWavetable.so"
	install -Dm644 "$srcdir/Wavetable.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Wavetable.lv2/manifest.ttl"
	install -Dm644 "$srcdir/Wavetable.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Wavetable.lv2/ui.ttl"
}

package_socalabs-wavetable-vst-bin() {
	pkgdesc="Socalabs Retro Wavetable Synth (VST)"
	groups=('vst-plugins')
	install -Dm755 "$srcdir/Wavetable.so" "$pkgdir/usr/lib/vst/Wavetable.so"
}

package_socalabs-wavetable-vst3-bin() {
	pkgdesc="Socalabs Retro Wavetable Synth (VST3)"
	groups=('vst3-plugins')
	install -Dm644 "$srcdir/Wavetable.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Wavetable.vst3/Contents/Resources/moduleinfo.json"
	install -Dm755 "$srcdir/Wavetable.vst3/Contents/x86_64-linux/Wavetable.so" "$pkgdir/usr/lib/vst3/Wavetable.vst3/Contents/x86_64-linux/Wavetable.so"
}
