# Maintainer: joel <aullidolunar at gmai1 d0t c0m>

_pkgname=gmtp

pkgname=${_pkgname}-gtk2
pkgver=1.3.10
pkgrel=2
pkgdesc="A simple MP3 player client for MTP based devices (gtk2 version)"
arch=('i686' 'x86_64')
url="http://gmtp.sourceforge.net/"
license=('BSD')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname})
depends=('flac' 'gtk2' 'libmtp' 'libid3tag' 'libvorbis')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://sourceforge.net/projects/gmtp/files/gMTP-${pkgver}/${_pkgname}-${pkgver}.tar.gz/download")
sha256sums=('b21b9a8e66ae7bb09fc70ac7e317a0e32aff3917371a7241dea73c41db1dd13b')

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr --with-gtk2
	make
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="${pkgdir}" install
}
