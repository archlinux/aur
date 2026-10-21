# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=figcraft-bin
_pkgname=figcraft
pkgver=0.9.0
pkgrel=1
pkgdesc="Open-source interface design and prototyping app, Figma alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/figcraft"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('67f786c816c255598bc120a150ac57cb5a8f246935d29fe8b4d2afa08f88330c')
sha256sums_aarch64=('849a72fe8c9b8d7b274080ece41ff6955bf40279390671c43e883489e34d8cd9')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}