# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=deckcraft-bin
_pkgname=deckcraft
pkgver=0.12.0
pkgrel=1
pkgdesc="Open-source native presentation app, PowerPoint alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/deckcraft"
license=('Apache-2.0' 'MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('4a410d3caa423e873d0dcab51c98e06588f55bdfcf03e9c1e91409a86c08de3e')
sha256sums_aarch64=('2312f1c0e0bf131faa525d71d265ba07734227fd2d174afbea00e95bcf93d353')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
