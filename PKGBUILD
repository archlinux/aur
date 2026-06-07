# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo-bin
_pkgname=melo
pkgver=0.1.2
pkgrel=1
pkgdesc="A stylish TUI music player for local libraries that follows your terminal/omarchy theme (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mbonikev/melo"
license=('MIT')
depends=('alsa-lib' 'libnotify' 'dbus')
provides=('melo')
conflicts=('melo')
options=(!debug !strip)

# One prebuilt tarball per architecture, attached to the GitHub Release.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")

# Replace SKIP with the real checksums: `updpkgsums` (after uploading the assets).
sha256sums_x86_64=('c2ae9e69f2dce072c5d11aae102a7b737a8327a714a90365a8d77bccb77805f4')
sha256sums_aarch64=('f8a477b1c50aa67c88f4f3db002d1e36e8010ae5e9aac92e228f8089854876ce')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
