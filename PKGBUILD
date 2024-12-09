# Contributor: hanker <91734413+hankertrix@users.noreply.github.com>

pkgname=ctpv
pkgver=1.1
pkgrel=4
pkgdesc="Image previews for lf file manager"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/ctpv"
license=('MIT')
depends=('file' 'openssl' 'glibc')
makedepends=('make')
optdepends=(
    'atool: for archive files'
    'bat: for text files'
    'chafa: for image files on Wayland'
    'colordiff: for diff files'
    'diff-so-fancy: for diff files'
    'elinks: for html files'
    'ffmpeg: for audio files'
    'ffmpegthumbnailer: for audio files'
    'fontforge: for font files'
    'git-delta: for diff files'
    'glow: for markdown files'
    'gnupg: for gpg-encrypted files'
    'highlight: for text files'
    'imagemagick: for svg files'
    'jq: for json files'
    'libreoffice-fresh: for office files'
    'lynx: for html files'
    'mdcat: for markdown files'
    'perl-image-exiftool: for any files'
    'poppler: for pdf files'
    'source-highlight: for text files'
    'transmission-cli: for torrent files'
    'ueberzug: for image files on X11'
    'w3m: for html files'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/NikitaIvanovV/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('96c9e42a70353ff9478027afd2d74b94e4bbcd4dd288c0911e15e1c37de903cdc3fab5ab30c4a19903a3cb096f6caf2f626de5d5b572bc9a56b57efe0ded5d85')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname"
}
