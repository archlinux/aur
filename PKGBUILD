# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.0
pkgrel=4
pkgdesc='Official MusicBrainz tagger'
url='http://musicbrainz.org/doc/MusicBrainz_Picard'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD lookup'
            'chromaprint: fingerprinting')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('abbd606a89b60ed8c948705d47ce1ae1a90f866a')

install=install

build() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
