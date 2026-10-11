# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=soundcraft-bin
_pkgname=soundcraft
pkgver=0.5.0
pkgrel=2
pkgdesc="Open-source native digital audio workstation, Pro Tools alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/soundcraft"
license=('Apache-2.0' 'MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('b1305b1a7ba7b8563204084dc0de652ef4236769ccf46a5e7f545a4a1060e803')
sha256sums_aarch64=('144aacd81c4940a4c379cf2f0b68ef067aa63cc329411cdacfb5b9e502ab2b69')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
