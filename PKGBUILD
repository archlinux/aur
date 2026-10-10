# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=pdfcraft-bin
_pkgname=pdfcraft
pkgver=0.5.0
pkgrel=1
pkgdesc="Open-source native PDF workbench, Acrobat alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/pdfcraft"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('20b35b3fd099c0ef02a727bf9badbaeeb6639c56742b4d0444cc2974dbff5fdf')
sha256sums_aarch64=('27e58b8ebacebca6c4e4b3110abd077a5cac0170987229d3ec69dcb35fcb4f84')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
