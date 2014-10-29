# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.3
pkgrel=3
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt' 'mutagen')
optdepends=('chromaprint: fingerprinting')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('dade79ecd7a158a89ecd7c59aa1ab9744071b20c')

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
