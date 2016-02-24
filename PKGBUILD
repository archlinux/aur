# Maintainer: Joshua Hardy joshinsilico
pkgname=xds
pkgver=20160930
pkgrel=1
pkgdesc="X-ray Detector Software for processing single-crystal monochromatic diffraction data recorded by the rotation method."
arch=(x86_64)
url="http://xds.mpimf-heidelberg.mpg.de/"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('bash')
makedepends=('prelink')
optdepends=('xdsgui' 'xds-viewer' 'xdsstat')
source=("ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz")
md5sums=('fe5ccdc8bc7ed1d20abe3166eeb98f93')
build() {
	cd "${srcdir}"/XDS-INTEL64_Linux_x86_64/
	execstack -c mintegrate_par
	execstack -c xds_par
	execstack -c mcolspot_par
	execstack -c xscale_par
}	
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/XDS-INTEL64_Linux_x86_64/* "${pkgdir}"/usr/bin/.
}
