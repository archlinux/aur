# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo-bin
_pkgname=melo
pkgver=0.1.3
pkgrel=1
pkgdesc="A stylish TUI music player for local libraries that follows your terminal/omarchy theme (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mbonikev/melo"
license=('MIT')
depends=('alsa-lib' 'dbus')
provides=('melo')
conflicts=('melo')
options=(!debug !strip)

# One prebuilt tarball per architecture, attached to the GitHub Release.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")

# Replace SKIP with the real checksums: `updpkgsums` (after uploading the assets).
sha256sums_x86_64=('9dbd3962f23bac0fa44c678fd885401dff5e0c29b28a6ecbc7f37eda839e437d')
sha256sums_aarch64=('a2133ad9ff7bf13b2211c1741eede6c3557fe1f0ae3742938e365e519a19fde0')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
