# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=cadcraft-bin
_pkgname=cadcraft
pkgver=0.20.1
pkgrel=1
pkgdesc="Open-source native CAD and drafting app, AutoCAD alternative (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/cadcraft"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('57b6f1b41b4f3c542a82f103202ed1a779440e5ff8d25c08ef66abda1a8cb1b9')
sha256sums_aarch64=('b149db4bdf61d135fcb40ce7361828c75b18d6f3f710e165ca17f30819d23212')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
