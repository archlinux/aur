# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=lib32-libfmod
pkgver=4.44.50
pkgrel=1
pkgdesc="Libraries of the fmodex audio engine"
arch=('x86_64')
url="http://www.fmod.org/"
license=('custom')
conflicts=('fmodex')
source=("http://www.fmod.org/download/fmodex/api/Linux/fmodapi${pkgver//./}linux.tar.gz")
sha512sums=('310c441a206f5355a44c047d1d0ebfd4d2c7c769db45e3a6e6f2741417a157075c069fecb8de989d459a731f55edbfc5a5b47dde4ea008aad39549ed7f137d2f')

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
