# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=wordcraft-bin
_pkgname=wordcraft
pkgver=0.15.0
pkgrel=1
pkgdesc="Open-source native word processor, Word alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/wordcraft"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('baacf18158124abc3d45dc4485bfc77a5d717f80ac50b80693b6501c26698e5d')
sha256sums_aarch64=('1a60f0a1a6e569bea37014157deac0c404e9fa580df7dd66599bc886928b9a06')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
