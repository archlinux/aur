# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.11
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem from many formats to MP3 or MP4 including video transcoding"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64') # Not arch-specific, should work on all
url="https://nschlia.github.io/ffmpegfs/"
license=('GPL3' 'FDL1.3')
makedepends=('asciidoc' 'w3m' 'xxd')
depends=('fuse' 'ffmpeg' 'sqlite' 'libbluray' 'libdvdread')
source=("https://github.com/nschlia/ffmpegfs/releases/download/v$pkgver/ffmpegfs-$pkgver.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 README.md "$pkgdir/usr/share/doc/ffmpegfs/README.md"
}

sha384sums=('b56bae9863d07c6ecf176cf3a10500b298958569e9982fd82dbeda0fe2a656d1162e826625f6a47a666b2302f8c70c16')
