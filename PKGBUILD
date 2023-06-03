# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=elan-bin
_pkgname_caps=ELAN
_pkgname=elan
pkgver="6.5"
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
provides=('elan')
conflicts=('elan')
license=('GPL3' 'apache')
source=("https://www.mpi.nl/tools/${_pkgname}/${_pkgname_caps}_${pkgver//\./\-}_linux.tar.gz"
		    "elan.desktop")
sha256sums=('0135a9bd67a8d5fbc3c8eeb0eb3395502753cfd1757ee4c99ae00d22545b3748'
            '3ae976fe400c61d002b28f7991f44493ea8a142a79a93afcc038a72a1171bb6f')

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver//\./\-}/"
	install -d -m755 "${pkgdir}/opt/elan"
	cp -r "lib" "${pkgdir}/opt/elan/"
	cp -r "bin" "${pkgdir}/opt/elan/"
	chmod +x "${pkgdir}/opt/elan/bin/ELAN"
	install -d -m755 "${pkgdir}/usr/bin/"
	ln -s "/opt/elan/bin/ELAN" "${pkgdir}/usr/bin/elan"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -D "${srcdir}/elan.desktop" "${pkgdir}/usr/share/applications/"
}
