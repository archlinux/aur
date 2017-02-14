# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.4
pkgrel=1
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt4' 'mutagen')
optdepends=('chromaprint: fingerprinting'
            'python2-discid: cd lookup')
makedepends=('python2-discid')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('030f54e2136781645075e82a1002e9c8e7545057')

build() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
