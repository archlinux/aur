# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=0.16
pkgrel=5
pkgdesc='Official MusicBrainz tagger'
url='http://musicbrainz.org/doc/MusicBrainz_Picard'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD lookup'
            'chromaprint: fingerprinting')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'typeheader.patch')
sha1sums=('274071410550ee29051bb0137d72602921a015f9'
          '0bd871632c28ef656af7ae89a8e752120f2cd7bd')

install=install

build() {
	cd "${srcdir}/picard-${pkgver}"
	patch -p1 -i ../typeheader.patch
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
