# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=1.3.2
pkgrel=3
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pyqt4' 'mutagen')
optdepends=('chromaprint: fingerprinting'
            'python2-discid: cd lookup')
makedepends=('python2-discid')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('084fdb184cb1d970dce953dd6c684932d464bf54')

install=install

build() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py config
}

package() {
	cd "${srcdir}/picard-release-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
	cp -r contrib/plugins/* "${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins/"
}
