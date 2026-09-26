# Maintainer: fireflylabs
_pkgname=abstract
pkgname=abstract-editor-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Minimal local-first markdown notes editor, GPU-rendered with GPUI"
arch=('x86_64')
url="https://github.com/fireflylabss/abstract"
license=('Apache-2.0' 'OFL-1.1')
depends=(
	'libxkbcommon'
	'libxkbcommon-x11'
	'libxcb'
	'xcb-util-wm'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'wayland'
	'fontconfig'
	'alsa-lib'
	'gcc-libs'
	'glibc'
)
provides=('abstract-editor' 'abstract')
conflicts=('abstract-editor')
source=(
	"$_pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fireflylabss/abstract/releases/download/v$pkgver/abstract-$pkgver-linux-x86_64.tar.gz"
	"abstract.desktop::https://raw.githubusercontent.com/fireflylabss/abstract/v$pkgver/assets/abstract.desktop"
	"abstract.png::https://raw.githubusercontent.com/fireflylabss/abstract/v$pkgver/assets/abstract.png"
	"OFL.txt::https://raw.githubusercontent.com/fireflylabss/abstract/v$pkgver/assets/fonts/OFL.txt"
)
sha256sums=('054e556a9783355bf490b204d32376c98e2f8f181f57854ecf4a8bae787645d6'
	'd004cd85b8ee160a0e87d99f041e4f8b77c75326b010ffcfbae61d080e68b94d'
	'39f026297aabb23e4fbf9add9a151f4a0548c1185c674caca1614a9efeaf72c5'
	'cee9892f9f0cc8fe882c9e9537ee6a89621d86ee7ceaf70b02e2b2b1c25c061a')

package() {
	# The release tarball unpacks abstract/, README.md and LICENSE at $srcdir root.
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/abstract"
	install -Dm644 abstract.desktop "$pkgdir/usr/share/applications/abstract.desktop"
	install -Dm644 abstract.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/abstract.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
