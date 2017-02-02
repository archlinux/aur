# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=xds
pkgver=20161101
pkgrel=2
pkgdesc="X-ray Detector Software for processing single-crystal monochromatic diffraction data recorded by the rotation method."
arch=(x86_64)
url="http://xds.mpimf-heidelberg.mpg.de/"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('bash')
makedepends=('prelink')
optdepends=('xdsgui' 'xds-viewer' 'xdsstat')
source=("ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz")
md5sums=('9ff1d56d5d4219961cd36df78b8086df')
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
