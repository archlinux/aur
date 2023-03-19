# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=1.4.1
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
sha256sums=('f34f4c2fa74c384114501dfd86a5ecf1806f3a7bc0be51a7e66ec2cc7d9fc34c'
            'ef319c6b163689c90ab4647bb5b58edf3051eb9f0383006e9caa8238bcc20e7e')

prepare() {
	patch --forward --strip=1 --input="$srcdir/monophony.patch"
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
