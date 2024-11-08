# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=octave-docs
pkgver=9.2.0
pkgrel=1
pkgdesc="GNU Octave documentation."
arch=(any)
url="https://www.gnu.org/software/octave/"
license=('GPL')
options=('docs')
source=(https://ftp.gnu.org/gnu/octave/octave-${pkgver}.tar.gz)
sha256sums=('0636554b05996997e431caad4422c00386d2d7c68900472700fecf5ffeb7c991')

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
