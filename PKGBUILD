# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=0.14
pkgrel=1
pkgdesc='Official MusicBrainz tagger'
url='http://musicbrainz.org/doc/MusicBrainz_Picard'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-qt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD-Lookup feature')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('bbc6aee61e779153b77e381e8cd2ba08')

install=install

build() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
