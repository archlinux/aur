# Maintainer: David Phillips <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=abduco
pkgver=0.3
pkgrel=1
pkgdesc="Tool for session {at,de}tach support which allows a process to run independently from its controlling terminal"
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/${pkgname}/"
license=('GPL')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0bbd3a52e256738d39edf8e73e43d72fd4bcf2d240f45b8287486910777310320e239e7d1abb523a37c573dc557a0e33bf5849aa34f50f261f50c27a80db7338')

build () {
	make all --directory="${srcdir}/${pkgname}-${pkgver}"
}

package () {
	make install PREFIX="${pkgdir}/usr" --directory="${srcdir}/${pkgname}-${pkgver}"
	install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
