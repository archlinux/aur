# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=gautomatch
pkgver=0.53
pkgrel=1
pkgdesc="A GPU accelerated program for accurate, fast, flexible and fully automatic particle picking from cryo‐EM micrographs with or without templates."
arch=(x86_64)
url="http://www.mrc-lmb.cam.ac.uk/kzhang"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('cuda')
makedepends=()
optdepends=()
source=("http://www.mrc-lmb.cam.ac.uk/kzhang/Gautomatch/Gautomatch_v0.53/bin/Gautomatch-v${pkgver}_sm_20_cu8.0_x86_64")
md5sums=('f4c1568d1afdc1dd0be7aef74d67d5be')
build() {
	cd "${srcdir}"/
	execstack -c G*
	echo "Gautomatch was designed by Kai Zhang@MRC Laboratory of Molecular Biology"
}	
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/* "${pkgdir}"/usr/bin/.
}
