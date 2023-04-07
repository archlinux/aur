# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=1.5.0
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('x86_64')
url="https://gitlab.com/zehkira/monophony"
license=('MIT')
groups=()
depends=(
	'libadwaita'
	'python-gobject'
	'python-mpris_server'
	'python-ordered-set'
	'python-requests'
	'python-ytmusicapi'
	'yt-dlp'
)
makedepends=('nuitka')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz" "monophony.patch")
sha256sums=(
	'27e368bca90581a669540fd2ac7933a507df4dd464ca80871650176d0c0671e2'
	'd17a314b65f52cc78fb7f3f343f2afe28bd5ce070eab1245488a724a73156805'
)

prepare() {
	patch --forward --strip=1 --input="$srcdir/monophony.patch"
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
