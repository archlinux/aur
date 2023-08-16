# Maintainer: Pig Fang <g-plane@hotmail.com>

_pkgname=yazi
pkgname=yazi-bin
pkgver=0.1.3
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
    'poppler: for PDF preview'
    'zoxide: for directory jumping')
provides=(yazi)
source=(
    "https://github.com/sxyazi/$_pkgname/releases/download/v$pkgver/$_pkgname-$arch-unknown-linux-gnu.zip"
    "https://github.com/sxyazi/$_pkgname/raw/v$pkgver/LICENCE")
sha256sums=('c0d0a704c50424610dcda705ade1c838c9143141d150c4c8083b0efc414c990d' SKIP)

package() {
  install -Dm644 "LICENCE" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
  install -Dm755 "$_pkgname-$arch-unknown-linux-gnu" "$pkgdir/usr/bin/$_pkgname"
}

