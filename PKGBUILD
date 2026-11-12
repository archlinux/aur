# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=materialcraft-bin
_pkgname=materialcraft
pkgver=0.4.1
pkgrel=1
pkgdesc="Design procedural PBR materials with node graphs (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('Apache-2.0' 'MIT')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland')
depends_aarch64=('libxcb')
optdepends=('flatpak: install Craft apps')
optdepends_aarch64=('vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('43115f8d3e2fee8f9f29bc07b03c984c2e8f6d04e0e1959439d73ec5cdf6830e')
sha256sums_aarch64=('43a37b6a484ddfdf059c907f3eff553f20da24dd2ccd4a5a088f5d5cb38b4415')

package() {
	local _root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"
	install -Dm755 "$_root/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 "$_root/bin/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	cp -a "$_root/share" "$pkgdir/usr/share"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 "$_root/share/doc/$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 "$_root/share/doc/$_pkgname/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}