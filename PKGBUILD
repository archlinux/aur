# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=unblur
pkgver=1.0.2
pkgrel=3
pkgdesc="Aligns the frames of movies recorded on an electron microscope to reduce image blurring due to beam-induced motion"
arch=(x86_64)
url="http://grigoriefflab.janelia.org/unblur"
license=('custom')
depends=('gnuplot' 'pdftk' 'julia')
optdepends=('summovie: uses alignment results to calculate movie frame sums')
source=("http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/unblur_${pkgver}.tar.gz" "LICENSE")
md5sums=('b6e367061cd0cef1b62a391a6289f681' 'SKIP')
options=()

prepare () {
	echo "Unblur was written by Timothy Grant and Alexis Rohou and is subject to Janelia Farm Research Campus Software Copyright 1.1."
}
#build() {
#}

package() {
	cd "${srcdir}/unblur_${pkgver}/bin"
	install -d $pkgdir/usr/bin/ "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m755 unblur_openmp_7_17_15.exe $pkgdir/usr/bin/unblur_openmp.exe
	install -D -m755 unblur_plot_shifts.sh     $pkgdir/usr/bin/.
	install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
