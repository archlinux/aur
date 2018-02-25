# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=spotify-ripper
pkgver=2.11
pkgrel=2
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="c/$_name"
license=('MIT')
depends=('python2' 'mutagen' 'python2-pyspotify' 'python2-colorama' 'python2-requests' 'python2-schedule' 'python2-spotipy' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python2-setuptools')
source=("https://github.com/SolidHal/spotify-ripper/archive/$pkgver.zip"
        "setup.py" "requirements.txt")
md5sums=('9e15172c41c80eb46b149a3799f9e66a'
         '2cc746f3bb1ed00e8bc7dc053829f5dc'
         '433ec722cffccd32c7e31807262f1128')

package() {
    # fix imports
    cp setup.py $pkgname-$pkgver/
    cp requirements.txt $pkgname-$pkgver/

    cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
