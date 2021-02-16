# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=shutter-encoder
pkgver=14.6
pkgrel=1
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com/"
license=('GPL')
depends=(java-runtime ffmpeg vlc mediainfo dvdauthor mkvtoolnix-cli perl-image-exiftool dcraw p7zip libcanberra uriparser libutil-linux expat youtube-dl)
source=("https://www.shutterencoder.com/Shutter%20Encoder%20(Linux%20Version%2014.6).deb")
options=('!strip')

sha256sums=('e32b14c691febcc1de0f61ba702a90a8904ac42722f7875d05606d6915819bb7')

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
