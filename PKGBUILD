# Maintainer: Pig Fang <g-plane@hotmail.com>

_pkgname=yazi
pkgname=yazi-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Blazing fast terminal file manager written in Rust, based on async I/O."
url="https://github.com/sxyazi/yazi"
arch=("x86_64")
license=("MIT")
depends=(gcc-libs ttf-nerd-fonts-symbols)
optdepends=(
    'jq: for JSON preview'
    'unarchiver: for archive preview'
    'ffmpegthumbnailer: for video thumbnails'
    'fd: for file searching'
    'ripgrep: for file content searching'
    'fzf: for directory jumping'
    'zoxide: for directory jumping')
provides=(yazi)
source=(
    "https://github.com/sxyazi/$_pkgname/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.zip"
    "https://github.com/sxyazi/$_pkgname/raw/v$pkgver/LICENCE")
sha256sums=('996435efd44072629c8fe7fd4d377cf0fba0bf688f1b8f14ec04acc475ac22aa' SKIP)

package() {
  install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
  install -Dm755 "$_pkgname-$arch-unknown-linux-gnu" "$pkgdir/usr/bin/$_pkgname"
}

