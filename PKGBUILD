pkgbase=harrison-drum-flow
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.0.1.2cc954a5
pkgrel=2
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/drum-flow"
license=('EULA')
groups=('pro-audio')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_DrumFlow_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('bdd1c9823299ec789ebce8fb7282ee1b5f996280978feb70bfd645d4301b9bed')

package_harrison-drum-flow-vst-bin() {
	pkgdesc="Harrison Drum Flow (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-df-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-df-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_DrumFlow/vst/Harrison_DrumFlow.so" "$pkgdir/usr/lib/vst/Harrison_DrumFlow.so"
}

package_harrison-drum-flow-vst3-bin() {
	pkgdesc="Harrison Drum Flow (VST3)"
	install -Dm755 "$srcdir/Harrison_DrumFlow/vst3/Harrison_DrumFlow.vst3/Contents/x86_64-linux/Harrison_DrumFlow.so" "$pkgdir/usr/lib/vst3/Harrison_DrumFlow.vst3/Contents/x86_64-linux/Harrison_DrumFlow.so"
}
