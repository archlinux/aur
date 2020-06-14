# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=ffmpegfs
pkgver=1.98
pkgrel=1
pkgdesc="FUSE-based transcoding filesystem with video support from many formats to MP4, WebM, OGG, MP3, OPUS, MOV, ProRes or WAV."
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

sha384sums=('034291d41540d5eaae27b96b8fef6ddb40d5fd69f09a37e7a1aba706efad3018dfd3effe6c06e1d40e6154c9fe29fc46')
