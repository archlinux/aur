# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=lib32-libfmod
pkgver=4.44.61
pkgrel=1
pkgdesc="Libraries of the fmodex audio engine"
arch=('x86_64')
url="http://www.fmod.org/"
license=('custom')
conflicts=('fmodex')
source=("http://www.fmod.org/download/fmodex/api/Linux/fmodapi${pkgver//./}linux.tar.gz")
sha512sums=('dfbb588b670c5f01fac9a263a55687736c711a2148cb24cb5fba2d4b26e7a6b6c046cdeffbfeb8e67aa1e7ea1a29a13c074a67dd3eecf4ed5557992f73ee42d9')

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
