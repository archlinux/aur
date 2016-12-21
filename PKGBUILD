# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=whatmp3
pkgver=3.8
pkgrel=1
pkgdesc="A small Python script that accepts a list of directories containing FLAC files as arguments and converts them to MP3 with the specified options. It can optionally create a torrent file."
url="https://github.com/RecursiveForest/whatmp3"
arch=('any')
license=('MIT')
depends=('python' 'mktorrent' 'flac')
optdepends=('vorbis-tools: OGG Vorbis support'
            'lame: MP3 support'
            'neroaacenc: AAC support'
            'neroaactag: AAC support'
            'mp3gain: ReplayGain support'
            'vorbisgain: ReplayGain support'
            'aacgain: ReplayGain support'
            'sox: dither support')
source=("https://github.com/RecursiveForest/whatmp3/archive/v${pkgver}.tar.gz")
sha256sums=('0d8ba70a1c72835663a3fde9ba8df0ff7007268ec0a2efac76c896dea4fcf489')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
