# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=summovie
pkgver=1.0.2
pkgrel=2
pkgdesc="Calculates electron microscopy movie frame sums using alignment results from Unblur"
arch=(x86_64)
url="http://grigoriefflab.janelia.org/unblur"
license=('custom')
depends=('unblur')
optdepends=()
source=("http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/summovie_${pkgver}.tar.gz" "LICENSE")
md5sums=('170b42d194c20d66b5de7d09e574bb89' 'SKIP')
options=()

prepare () {
	echo "Summovie was written by Timothy Grant and Alexis Rohou and is subject to Janelia Farm Research Campus Software Copyright 1.1."
}

package() {
	cd "${srcdir}/summovie_${pkgver}/bin"
	install -d $pkgdir/usr/bin/ "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m755 * $pkgdir/usr/bin/summovie.exe
	install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
