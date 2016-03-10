# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=whatmp3
pkgver=3.7
pkgrel=1
pkgdesc="A small Python script that accepts a list of directories containing FLAC files as arguments and converts them to MP3 with the specified options. It can optionally create a torrent file."
url="http://logik.li/projects/whatmp3/"
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
sha256sums=('a8b688e2e5873e3bf527fc44e8f3966227b432cf59593062dd58493df65de3b0')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
