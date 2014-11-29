# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname='essentia-acousticbrainz'
pkgver=2.1_beta2
pkgrel=1
pkgdesc="audio analysis and audio-based music information retrieval (binary for acousticbrainz)"
url="http://acousticbrainz.org/download"
arch=('x86_64' 'i686')
license=('AGPL')
source=(http://acousticbrainz.org/static/download/essentia-extractor-v${pkgver}-linux-${CARCH}.tar.gz)
if [ "$CARCH" = "x86_64" ]; then
	sha256sums=('d9902aadac4f442992877945da2a6fe8d6ea6b0de314ca8ac0c28dc5f253f7d8')
else
	sha256sums=('46deb0a053b4910c4e68737a7b6556ff5360260c8f86652f91a0130445f5c949')
fi

package() {
    cd "$srcdir"
    install -D streaming_extractor_music \
	    $pkgdir/usr/bin/streaming_extractor_music
}
