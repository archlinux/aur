#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=audenc
pkgver=3.3.5
pkgrel=1
pkgdesc='a batch shell script for encoding audio files in directories from one format to another.'
arch=(any)
url='https://audenc.sourceforge.io/'
license=(GPL2)
depends=(mediainfo
         mplayer)
optdepends=('lame: MP3 encoder'
            'flac: FLAC encoder'
            'vorbis-tools: OGG encoder'
            'neroaacenc: Nero AAC encoder'
            'neroaactag: Nero AAC tagger'
            'neroaac: Nero AAC encoder and tagger within one package'
            'faac: FAAC encoder'
            'aacplusenc: AAC+ encoder'
            'fdk-aac-enc: FDK-AAC encoder'
            'gpac: MP4 container for AAC+/FDK-AAC'
            'opus-tools: Opus encoder'
            'amrenc: AMR encoder'
            'aften: A/52 encoder'
            'dcaenc: DTS encoder')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0cada50cedf5b3c84c2d5c85f6567e6780cd612504fb7eab38e0e638c0724535')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"
    sed -i -e "s,/usr/local,$pkgdir/usr,g" \
           -e '/^MANDIR=/s,usr/man,usr/share/man,' install
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./install
    rm "$pkgdir/usr/share/doc/audenc/uninstall"
}
