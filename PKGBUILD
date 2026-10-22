# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=soundcraft-bin
_pkgname=soundcraft
pkgver=0.12.1
pkgrel=1
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
sha256sums_x86_64=('b0a56bd6b5d27de6b12e354580c362be6f59125ea58f573044c84f6a7da87780')
sha256sums_aarch64=('b16513d16be67a9715ec650db955ee6b41624db21fc182905ccaaa311547700d')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
