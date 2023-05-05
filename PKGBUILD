#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=audenc
pkgver=3.3.9
pkgrel=1
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
sha256sums=('e235fb1e7092839241045ea95bbe412ea14c7b095d4018e2595d144e74f71cfc')

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
