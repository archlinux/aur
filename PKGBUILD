# Maintainer: iRet <iRet at a22 dot in>
# Contributor: XavierCLL <xavier.corredor.llano at gmail dot com>

pkgname=spotify-ripper
pkgver=2.17
pkgrel=1
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="https://github.com/scaronni/spotify-ripper"
license=('MIT')
depends=('python' 'python-spotify' 'python-spotipy' 'python-mutagen' 'python-colorama' 'python-requests' 'python-schedule' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 
            'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 
            'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python-setuptools' 'libspotify')
source=("https://github.com/iRet/spotify-ripper/archive/${pkgver}.tar.gz"
        "setup.py" "requirements.txt")
md5sums=('84da50eba2fe16433673c65b388ba820'
         'f0bb6c10b14365ead3fc0084197ada64'
         '433ec722cffccd32c7e31807262f1128')

package() {
    cd $pkgname-$pkgver
    
    # fix imports
    cp ../setup.py .
    cp ../requirements.txt .
    
    python setup.py install --root="$pkgdir"
}
