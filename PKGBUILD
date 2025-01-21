# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=capella-bin
pkgver=7.0.0.202407091438
pkgrel=1
pkgdesc='Model-Based Systems Engineering tool that implements the Arcadia method.'
arch=('x86_64' 'aarch64')
depends=(
	'alsa-lib'
	'bash'
	'java-runtime'
	'perl'
	'python'
	'libx11'
	'libxext'
	'libxi'
	'libxrender'
	'libxtst'
)
url="https://mbse-capella.org/"
license=('EPL-2.0')
_name_tgz="${pkgname%-bin}-${pkgver}-linux-gtk-${arch}.tar.gz"
source_x86_64=("https://mirror.umd.edu/eclipse/${pkgname%-bin}/core/products/releases/${pkgver:0:5}/${_name_tgz}")
source_aarch64=("${source_x86_64}")
sha512sums_x86_64=('a1da02b436fac1921308f540aed7e687189f1881a797f8579a1e45fdf344735d4a0a2cbf5c97f30f3ec42fbed6da596dc22fb23fc2bb7a1960a021308fc47f79')
sha512sums_aarch64=('cc42e68784fe066567cf5202209be15d3016834232be128e06d04b2260ea598b29f432237ae572177a81d7b6b118db62ac47f1926f45703545da62727921b693')

package() {
	mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
	mv ${srcdir}/${pkgname%-bin} "${pkgdir}/opt"
	ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin"
}
