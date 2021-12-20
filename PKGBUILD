# Maintainer: iRet <iRet at a22 dot in>
# Contributor: XavierCLL <xavier.corredor.llano at gmail dot com>

pkgname=spotify-ripper
pkgver=2.18
pkgrel=1
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="https://github.com/scaronni/spotify-ripper"
license=('MIT')
depends=('python' 'python-pyspotify>=2.1.3-4' 'python-spotipy>=2.19.0-2' 'python-mutagen' 'python-colorama' 'python-requests' 'python-schedule' 'lame')
optdepends=('flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 
            'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 
            'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python-setuptools' 'libspotify')
source=("https://github.com/scaronni/spotify-ripper/archive/${pkgver}.tar.gz"
        "setup.py" "requirements.txt")
md5sums=('74f11d4cebc0b3d0a479531eaae40c8a'
         '0cf83405e3b811277e3f3a11b01f7426'
         '433ec722cffccd32c7e31807262f1128')

package() {
    cd $pkgname-$pkgver
    
    # fix imports
    cp ../setup.py .
    cp ../requirements.txt .
    
    python setup.py install --root="$pkgdir"
}
