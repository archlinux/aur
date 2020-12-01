# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=octave-docs
pkgver=6.1.0
pkgrel=1
pkgdesc="GNU Octave documentation."
arch=(any)
url="https://www.gnu.org/software/octave/"
license=('GPL')
options=('docs')
source=(https://ftp.gnu.org.ua/gnu/octave/octave-$pkgver.tar.gz{,.sig})
sha256sums=('6ff34e401658622c44094ecb67e497672e4337ca2d36c0702d0403ecc60b0a57'
            'SKIP')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton

package() {
	cd "${pkgname%-docs}-$pkgver"
	install -d $pkgdir/usr/share/doc/octave/{interpreter,liboctave,refcard}
	cp -ar doc/interpreter/octave.html $pkgdir/usr/share/doc/octave/interpreter/html
	cp -ar doc/liboctave/liboctave.html $pkgdir/usr/share/doc/octave/liboctave/html
	cp -a  doc/refcard/*.{pdf,ps} $pkgdir/usr/share/doc/octave/refcard/
}
# vim:set ts=4 sw=4:
