# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>

_pkgname=hbhc
pkgname=${_pkgname}-git
pkgver=r19.ab97cd6
pkgrel=1
pkgdesc="A fast and Open Source Home Baked Hash Cracker for linux Written in Python3"
arch=('any')
url="https://github.com/ASHWIN990/${_pkgname}"
license=('GPL3')
depends=('python3')
makedepends=('git')
provides=('hbhc')
source=("git+https://github.com/ASHWIN990/hbhc.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
        install -Dm775 sha* -t ${pkgdir}/usr/bin/ | echo -e "MOVING THE PYTHON SCRIPTS IN /usr/bin"
        install -Dm775 md5* -t ${pkgdir}/usr/bin/
        install -Dm775 hbhc -t ${pkgdir}/usr/bin/
	install -Dm644 ${PWD}/.man/hbhc.1.gz -t ${pkgdir}/usr/share/man/man1/

}
