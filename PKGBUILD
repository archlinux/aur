#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=audenc
pkgver=3.3.5
pkgrel=2
pkgdesc='a batch shell script for encoding audio files in directories from one format to another.'
arch=(any)
url='https://audenc.sourceforge.io/'
license=(GPL2)
depends=(mediainfo mplayer)
optdepends=(
    'aacplusenc: AAC+ encoder'
    'aften: A/52 encoder'
    'amrenc: AMR encoder'
    'dcaenc: DTS encoder'
    'faac: FAAC encoder'
    'fdk-aac-enc: FDK-AAC encoder'
    'flac: FLAC encoder'
    'gpac: MP4 container for AAC+/FDK-AAC'
    'lame: MP3 encoder'
    'neroaacenc-bin: Nero AAC encoder (deprecated)'
    'neroaactag-bin: Nero AAC tagger (deprecated)'
    'opus-tools: Opus encoder'
    'vorbis-tools: OGG encoder'
)
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0cada50cedf5b3c84c2d5c85f6567e6780cd612504fb7eab38e0e638c0724535')

prepare() {
    cd $pkgname-$pkgver
    sed -i -e "s,/usr/local,$pkgdir/usr,g" \
        -e '/^MANDIR=/s,usr/man,usr/share/man,' install
}

package() {
    cd $pkgname-$pkgver
    ./install
    rm "$pkgdir/usr/share/doc/audenc/uninstall"
}
