# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.4.2
pkgrel=1
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('x86_64')
depends=('python2-pyqt4' 'mutagen')
optdepends=('chromaprint: fingerprinting'
            'python2-discid: cd lookup')
makedepends=('python2-discid')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f0adee3877bbd66c827a43b57dd2233037b99f6ebfdc1700b26cb9d400992234')

build() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
