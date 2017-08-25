# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=lltag
pkgver=0.14.6
pkgrel=1
pkgdesc="Automatic command-line music (mp3/ogg/flac) file tagger and renamer"
arch=('i686' 'x86_64')
url="http://bgoglin.free.fr/lltag/"
license=('GPL2')
depends=('perl')
optdepends=('mp3info: id3 support'
            'perl-mp3-tag: id3v2 support'
            'vorbis-tools: ogg support'
            'flac: FLAC support')
source=(
    "https://github.com/bgoglin/lltag/archive/lltag-$pkgver.tar.gz"
    "https://github.com/bgoglin/lltag/releases/download/lltag-$pkgver/lltag-$pkgver.tar.gz.asc")
sha512sums=(
    9eb488ac1444ec11b02ca9c396903b5c6ef1e2f19558a6ef9d5e8d3fadb639fad902b4d6cdde8f4374768fdea553cfd6550c4151df9a755c9ae4a5652128a836
    de732be69da86dfb020062504baa82ffdabf497eba417196cc4a3bf1029d7edc88b286970d73f35587020b65d655384167d8c196de37055df9737b654b08cbc7
)
validpgpkeys=(
    7A5A4E80E40097BAF6EAD638449190F3235ABD3B # Brice Goglin
)

build() {
    cd "$srcdir"/$pkgname-$pkgname-$pkgver
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgname-$pkgver
    make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man \
         DOCDIR=/usr/share/doc/$pkgname-$pkgver install install-man install-doc
}
