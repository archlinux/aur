# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=deckcraft-bin
_pkgname=deckcraft
pkgver=0.10.0
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
sha256sums_x86_64=('546616eb2300ce8efb20b44a53e60abfe6b96d71ac606b452a36fd21c6b1ff28')
sha256sums_aarch64=('7be0594d90c4c0be15b812a597b85f6005271716be778b2999cb492f52c8676b')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
