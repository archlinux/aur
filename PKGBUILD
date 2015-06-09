#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=audenc
pkgver=3.3.3
pkgrel=3
pkgdesc='a batch shell script for encoding audio files in directories from one format to another.'
arch=(any)
url='http://sourceforge.net/projects/audenc/'
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
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")

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
md5sums=('b302a6f1198e08a6ba3dd5b674c8fc29')
