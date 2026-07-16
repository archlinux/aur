# Maintainer: cafreo

_name=ctpv
pkgname="${_name}-fork"
pkgver=1.2
pkgrel=1
pkgdesc="Image previews for lf file manager"
arch=('i686' 'x86_64')
url="https://github.com/cafreo/ctpv"
license=('MIT')
provides=("$_name")
conflicts=("$_name")
depends=('file' 'openssl' 'glibc')
makedepends=('make')
optdepends=(
    'bat: for text files'
    'chafa: for image files on Wayland'
    'colordiff: for diff files'
    'diff-so-fancy: for diff files'
    'elinks: for html files'
    'ffmpegthumbnailer: for audio files'
    'git-delta: for diff files'
    'glow: for markdown files'
    'gnupg: for gpg-encrypted files'
    'highlight: for text files'
    'imagemagick: for font, psd and svg files'
    'jq: for json files'
    'libreoffice-fresh: for office files'
    'lynx: for html files'
    'mdcat: for markdown files'
    'ouch: for archive files'
    'perl-image-exiftool: for any files'
    'poppler: for pdf files'
    'source-highlight: for text files'
    'transmission-cli: for torrent files'
    'ueberzug: for image files on X11'
    'w3m: for html files'
)
source=("$_name-v$pkgver.tar.gz::https://github.com/cafreo/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    make
}

package() {
    cd "$_name-$pkgver"
    install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$_name/LICENSE"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$_name"
}

