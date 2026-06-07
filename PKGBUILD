# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo-bin
_pkgname=melo
pkgver=0.1.0
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
sha256sums_x86_64=('3c7136354d468e95a3792dea8e79713d3cdfb2da454e2bdfaeff225a9d289fdc')
sha256sums_aarch64=('bad1dc36de75909fbdd69ff17cfe6509a496fdc0d3416b50de48034f50a9dfeb')

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
