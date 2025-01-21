# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=whatmp3
pkgver=3.9
pkgrel=1
pkgdesc="Convert a list of directories containing FLAC files into MP3"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RecursiveForest/whatmp3/archive/v${pkgver}.tar.gz")
b2sums=('45194bcd0ffffdabc87e6819f96c619295bb8eef7cfaff6ffb44d3981d821fe6801fa2ae68d24e1b5000e0b3193e697176821982d6184ba7b775f19abc595636')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
