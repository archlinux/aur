# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.2
pkgrel=3
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt' 'mutagen')
optdepends=('libdiscid: CD lookup'
            'chromaprint: fingerprinting')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('323e22adef321a8fb80d617eb86a880f7d546fca')

install=install

build() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
	cp -r contrib/plugins/* "${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins/"
}
