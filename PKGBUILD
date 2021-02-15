pkgname=lang815bkg-faustus
_gitname=lang815bkg-faustus
pkgver=0.2
pkgrel=2
pkgdesc="Backend for lang815 to change keys led color, when language layout is changed for ASUS TUF Gaming series laptops"
arch=('any')
url="https://gitlab.com/SR_team/lang815bkg-faustus"
license=('GPL3')
depends=('lang815')
makedepends=('git' 'gcc' 'make' 'cmake')
install=${pkgname}.install
options=(!emptydirs)
source=("git+https://gitlab.com/SR_team/lang815bkg-faustus.git")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	cmake -DCMAKE_BUILD_TYPE=MinSizeRel .
	make
}

package() {
	cd ${_gitname}
	mkdir -p ${pkgdir}/usr/lib/
	cp libLang815bkg-faustus.so ${pkgdir}/usr/lib/
	chmod -R 755 ${pkgdir}/usr
}
