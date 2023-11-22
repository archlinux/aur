pkgbase=harrison-vocal-flow
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.0.0.e8e07e48
pkgrel=1
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/vocal-flow"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_VocalFlow_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('708163897972301e73a57a49f3718ff54c10df6b16ffe8cc1f30c4a023a271a6')

package_harrison-vocal-flow-vst-bin() {
	pkgdesc="Harrison Vocal Flow (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-vf-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-vf-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_VocalFlow/vst/Harrison_VocalFlow.so" "$pkgdir/usr/lib/vst/Harrison_VocalFlow.so"
}

package_harrison-vocal-flow-vst3-bin() {
	pkgdesc="Harrison Vocal Flow (VST3)"
	install -Dm755 "$srcdir/Harrison_VocalFlow/vst3/Harrison_VocalFlow.vst3/Contents/x86_64-linux/Harrison_VocalFlow.so" "$pkgdir/usr/lib/vst3/Harrison_VocalFlow.vst3/Contents/x86_64-linux/Harrison_VocalFlow.so"
}
