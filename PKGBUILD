# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=libfmod
pkgver=4.44.50
pkgrel=1
pkgdesc="Libraries of the fmodex audio engine"
arch=('i686' 'x86_64')
url="http://www.fmod.org/"
license=('custom')
conflicts=('fmodex')
source=("http://www.fmod.org/download/fmodex/api/Linux/fmodapi${pkgver//./}linux.tar.gz")
sha512sums=('310c441a206f5355a44c047d1d0ebfd4d2c7c769db45e3a6e6f2741417a157075c069fecb8de989d459a731f55edbfc5a5b47dde4ea008aad39549ed7f137d2f')

package() {
	if [ $CARCH == 'i686' ]; then
		install -Dm644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodex-${pkgver}.so ${pkgdir}/usr/lib/libfmodex-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodexL-${pkgver}.so ${pkgdir}/usr/lib/libfmodexL-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodevent-${pkgver}.so ${pkgdir}/usr/lib/libfmodevent-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventL-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventL-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventnet-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventnet-${pkgver}.so
	else
		install -Dm644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodex64-${pkgver}.so ${pkgdir}/usr/lib/libfmodex-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/api/lib/libfmodexL64-${pkgver}.so ${pkgdir}/usr/lib/libfmodexL-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodevent64-${pkgver}.so ${pkgdir}/usr/lib/libfmodevent-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventL64-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventL-${pkgver}.so
		install -m644 ${srcdir}/fmodapi${pkgver//./}linux/fmoddesignerapi/api/lib/libfmodeventnet64-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventnet-${pkgver}.so
	fi
	ln -s libfmodex-${pkgver}.so ${pkgdir}/usr/lib/libfmodex.so
	ln -s libfmodexL-${pkgver}.so ${pkgdir}/usr/lib/libfmodexL.so
	ln -s libfmodevent-${pkgver}.so ${pkgdir}/usr/lib/libfmodevent.so
	ln -s libfmodeventL-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventL.so
	ln -s libfmodeventnet-${pkgver}.so ${pkgdir}/usr/lib/libfmodeventnet.so
	install -Dm644 ${srcdir}/fmodapi${pkgver//./}linux/documentation/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
