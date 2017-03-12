# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=motioncor2
pkgver=01302017
pkgrel=1
pkgdesc="A multi-GPU program that corrects beam-induced sample motion on dose fractionated movie stacks"
arch=(x86_64)
url="http://msg.ucsf.edu/em/software/motioncor2.html"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('cuda' 'nvidia-utils' 'libtiff')
makedepends=()
optdepends=()
source=("http://msg.ucsf.edu/MotionCor2/MotionCor2-01-30-2017.tar.gz")
md5sums=('aec2f2653ba948e6d9a91a851171ce27')
build() {
	cd "${srcdir}"/
	execstack -c MotionCor2-??-??-????
	echo "MotionCor2 was designed by Shawn Zheng@University of California and is free for academic use. Cite publication: Shawn Q. Zheng, Eugene Palovcak, Jean-Paul Armache, Yifan Cheng and David A. Agard (2016) Anisotropic Correction of Beam-induced Motion for Improved Single-particle Electron Cryo-microscopy, Nature Methods, submitted. BioArxiv: http://biorxiv.org/content/early/2016/07/04/061960"
}	
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib
	install -D -m755 "${srcdir}"/MotionCor2-??-??-???? "${pkgdir}"/usr/bin/MotionCor2
	ln -s /usr/lib/libtiff.so "${pkgdir}"/usr/lib/libtiff.so.3
}
