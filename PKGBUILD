# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=gctf
pkgver=1.06
pkgrel=1
pkgdesc="GPU accelerated program for Real-Time CTF determination, refinement, evaluation and correction."
arch=(x86_64)
url="http://www.mrc-lmb.cam.ac.uk/kzhang"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('cuda')
makedepends=('prelink')
optdepends=()
source=("http://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v${pkgver}/bin/Gctf-v${pkgver}_sm_20_cu8.0_x86_64" "http://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v${pkgver}/bin/Gctf-v${pkgver}_sm_30_cu8.0_x86_64")
md5sums=('b7c66feab45e4924a48af7f7ed24a475' '4f343154991ad790d99043ae40b20fba')
build() {
	cd "${srcdir}"/
	execstack -c Gctf*
	echo "Gctf was designed by Kai Zhang@MRC Laboratory of Molecular Biology"
}	
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/* "${pkgdir}"/usr/bin/.
}
