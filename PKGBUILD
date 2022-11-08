# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=octave-docs
pkgver=7.3.0
pkgrel=1
pkgdesc="GNU Octave documentation."
arch=(any)
url="https://www.gnu.org/software/octave/"
license=('GPL')
options=('docs')
source=(https://ftp.gnu.org/gnu/octave/octave-${pkgver}.tar.gz{,.sig})
sha256sums=('6e14a4649d70af45ab660f8cbbf645aaf1ec33f25f88bfda4697cb17e440c4f5'
            'SKIP')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton

package() {
	cd "${pkgname%-docs}-${pkgver}"
	# HTML
	install -d ${pkgdir}/usr/share/doc/octave/html
	cp -r doc/interpreter/octave.html \
		${pkgdir}/usr/share/doc/octave/html/octave
	cp -r doc/liboctave/liboctave.html \
		${pkgdir}/usr/share/doc/octave/html/liboctave
	# PDF
	install -Dt ${pkgdir}/usr/share/doc/octave/pdf -m 644 \
		doc/interpreter/octave.pdf \
		doc/liboctave/liboctave.pdf \
		doc/refcard/*.pdf
	# PS
	install -Dt ${pkgdir}/usr/share/doc/octave/ps -m 644 \
		doc/interpreter/octave.ps \
		doc/liboctave/liboctave.ps \
		doc/refcard/*.ps
}
# vim:set ts=4 sw=4:
