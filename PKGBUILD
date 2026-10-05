# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr-bin
_pkgname=whatevr
pkgver=0.9.0
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (prebuilt whatevrd daemon + whattui terminal frontend)"
arch=('x86_64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('glibc' 'libjpeg-turbo')
optdepends=('ffmpeg: video posters and voice note waveforms')
provides=('whatevr' 'whatevrd' 'whattui')
conflicts=('whatevr' 'whatevr-git')
install="$_pkgname.install"
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.zst")
sha256sums_x86_64=('0e9b75efe930a5ea51fd7a9743feabf6406333a619fe28336117bd5cacd9e11f')

package() {
	local root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"

	cp -a "$root/usr" "$pkgdir/"
	install -Dm644 "$root/usr/share/licenses/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
