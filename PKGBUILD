# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=skf
pkgver=2.00.1
_sfver=63430
_mjver=2.00
pkgrel=1
pkgdesc='Simple Kanji Filter - i18n kanji converter'
arch=('i686' 'x86_64')
url="http://osdn.jp/projects/skf/"
license=('BSD')
depends=('glibc')
makedepends=('perl')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=("http://${_mirror}.dl.osdn.jp/skf/${_sfver}/skf_${pkgver}.tar.gz")

build() {
	cd "${srcdir}/skf-${_mjver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/skf-${_mjver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

md5sums=('94bedc238bd3cc0db054cf40670771b2')
