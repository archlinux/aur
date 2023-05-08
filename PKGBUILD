# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=shutter-encoder
pkgver=17.1
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com/"
license=('GPL')
depends=(java-runtime ffmpeg vlc mediainfo dvdauthor mkvtoolnix-cli perl-image-exiftool dcraw p7zip libcanberra uriparser util-linux-libs expat yt-dlp)
source=("https://www.shutterencoder.com/Shutter%20Encoder%20$pkgver%20Linux%2064bits.deb")
options=('!strip')

sha256sums=('e9d59174818166531199d9c0fe1ee3c9795133a97237e038636e240f072bc04b')

prepare() {
    mkdir -p shutter-encoder
    tar -xJf data.tar.xz -C shutter-encoder/
}


package() {
    # Move main folder in place 
    mv "${srcdir}"/shutter-encoder/usr "${pkgdir}"/;
    mkdir -p "$pkgdir"/usr/share/pixmaps/
    install -m 644 "${pkgdir}"/usr/lib/Shutter\ Encoder/usr/bin/icon.png "$pkgdir"/usr/share/pixmaps/shutter-encoder.png
    chmod -R 755 "$pkgdir"/usr/lib/Shutter\ Encoder/
}
