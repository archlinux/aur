# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=lib32-libfmod
pkgver=4.44.64
pkgrel=1
pkgdesc="Libraries of the fmodex audio engine"
arch=('x86_64')
url="http://www.fmod.org/"
license=('custom')
conflicts=('fmodex')
source=(https://zdoom.org/files/fmod/fmodapi44464linux.tar.gz)
sha512sums=('SKIP')

package() {
	install -Dm644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodex-${pkgver}.so ${pkgdir}/usr/lib32/libfmodex-${pkgver}.so
	install -m644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodexL-${pkgver}.so ${pkgdir}/usr/lib32/libfmodexL-${pkgver}.so
	install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodevent-${pkgver}.so ${pkgdir}/usr/lib32/libfmodevent-${pkgver}.so
	install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventL-${pkgver}.so ${pkgdir}/usr/lib32/libfmodeventL-${pkgver}.so
	install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventnet-${pkgver}.so ${pkgdir}/usr/lib32/libfmodeventnet-${pkgver}.so
	ln -s libfmodex-${pkgver}.so ${pkgdir}/usr/lib32/libfmodex.so
	ln -s libfmodexL-${pkgver}.so ${pkgdir}/usr/lib32/libfmodexL.so
	ln -s libfmodevent-${pkgver}.so ${pkgdir}/usr/lib32/libfmodevent.so
	ln -s libfmodeventL-${pkgver}.so ${pkgdir}/usr/lib32/libfmodeventL.so
	ln -s libfmodeventnet-${pkgver}.so ${pkgdir}/usr/lib32/libfmodeventnet.so
	install -Dm644 ${srcdir}/fmodapi${pkgver//./}linux/documentation/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
