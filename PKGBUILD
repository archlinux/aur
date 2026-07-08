# Maintainer: Dustin Widmann <dustin@aradiocorp.com>
pkgname=videocleaver
pkgver=1.0.0
pkgrel=1
pkgdesc="Splits video files on chapter boundaries using ffmpeg, with an embedded mpv viewer"
arch=('x86_64')
url="https://gitlab.com/dustinwidmann/videocleaver"
license=('CC0')
depends=('ffmpeg' 'mpv' 'qt6-base')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf' 'git')
source=("$pkgname::git+https://gitlab.com/dustinwidmann/videocleaver.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname/code" -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
