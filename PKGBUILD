# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=ctffind4
pkgver=4.1.5
pkgrel=1
pkgdesc="Find CTFs of electron micrographs"
arch=(x86_64)
url="http://grigoriefflab.janelia.org/ctf"
license=('GPL')
depends=('')
optdepends=('pdftk: for improved pdf output'
	    'gnuplot: for improved pdf output')
source=("http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/ctffind-$pkgver-linux64.tar.gz" 'LICENSE')
md5sums=('4e5ffbe72097819d12945f6392e22dcc' 'SKIP')
options=()

prepare () {
	echo "The program CTFFIND4 was developed by Nikolaus Grigorieff at the MRC Laboratory of Molecular Biology in Cambridge, UK with financial support from the MRC. This software is licensed under the terms of the Janelia Research Campus Software Copyright 1.1."
}
#build() {
#}

package() {
	cd "$srcdir/bin"
	install -d $pkgdir/usr/bin/ "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m755 ctffind $pkgdir/usr/bin/.
	install -D -m755 ctffind_plot_results.sh $pkgdir/usr/bin/.
	install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
