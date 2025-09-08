# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=doublecmd-admin
pkgver=0.1
pkgrel=1
pkgdesc="Run Double Commander as root."
arch=('any')
url="http://doublecmd.sourceforge.net/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('doublecmd' 'polkit' 'wmctrl' 'xdotool')
options=('!strip')
source=('https://gitlab.com/linux-stuffs/linux-goodies/-/raw/master/run-as-root/doublecmd-admin/distrib/doublecmd-admin-0.1-1.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
