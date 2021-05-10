#Maintainer: Bazza <bazza@riseup.net>

pkgname=('deepflow2')
pkgver=2
pkgrel=1
pkgdesc="Large displacement optical flow with deep matching"
#provides=("Philippe Weinzaepfel,Jerome Revaud,Zaid Harchaoui,Cordelia Schmid")
makedepends=()
url='https://thoth.inrialpes.fr/src/deepflow/'
arch=('any')
source=("http://pascal.inrialpes.fr/data2/deepmatching/files/DeepFlow_release2.0.tar.gz")
md5sums=('f86cfd144e7f729d97878eee069baad9')
license=('GPL')
options=(!strip)

prepare(){
	cd DeepFlow_release2.0
	make
}

package(){
	mkdir -p "${pkgdir}"/usr/bin/
	cp "${srcdir}"/DeepFlow_release2.0/deepflow2 "${pkgdir}"/usr/bin/
	chmod 755 "${pkgdir}"/usr/bin/deepflow2
}
