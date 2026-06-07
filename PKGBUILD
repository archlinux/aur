# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo-bin
_pkgname=melo
pkgver=0.1.1
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
sha256sums_x86_64=('ff9322debd6671656a132841f0bed32680f772d3bce03c30599980d295b13ae4')
sha256sums_aarch64=('db61aa76becc06615ae60c5911caef9030cc4f2ec595a38df29bfc33bda076e0')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
