# Maintainer: William Gathoye <william at gathoye dot be>

pkgname=lltag
pkgver=0.14.5
pkgrel=1
pkgdesc="Automatic command-line music (mp3/ogg/flac) file tagger and renamer"
arch=('i686' 'x86_64')
url="http://home.gna.org/lltag"
license=('GPL2')
depends=('perl')
optdepends=('mp3info: id3 support'
            'perl-mp3-tag: id3v2 support'
            'vorbis-tools: ogg support'
            'flac: FLAC support')
source=("http://download.gna.org/lltag/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=(
    64d16ae1bfb920f2e10add6728bdbe261662688b5c99e4cc92ffa5d7dd5fe596c6c3ccbe61b432a4594e49003fc981b20588def9523a65ee934418afb512bedd
    12bf630cc2238a9d9f6cfb35882a45233b54ec505551788f4d8ede665dbeaa91adaaa9aa7690c8457c0ce49d71bcc3c0a4f9879e32134ac30bd92096bc481b92
)
validpgpkeys=(
    7A5A4E80E40097BAF6EAD638449190F3235ABD3B # Brice Goglin
)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man \
         DOCDIR=/usr/share/doc/$pkgname-$pkgver install install-man install-doc
}
