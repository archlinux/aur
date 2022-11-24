# Maintainer: Porta <portalmaster137@gmail.com>
pkgname="printargnum"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="im having fun with this."
arch=('x86_64')
_archive_url="https://github.com/portalmaster137/printargslol/raw/master/archive.7z"
license=('MIT')
depends=('p7zip' 'gcc' 'cmake')
source=($_archive_url)
sha256sums=('8828402a4a8290f314bd95fb1c0f96a40f0392e7e9d1e611ae2d6501cb630314')

build() {
    cd "$srcdir"
    7z x -aoa archive.7z
    cmake . -B ./build
    cmake --build ./build
}

package() {
    cd "$srcdir"
    install -Dm755 ./build/printargnum "$pkgdir/usr/bin/printargnum"
}