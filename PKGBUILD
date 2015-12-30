# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=libfmod
pkgver=4.44.59
pkgrel=1
pkgdesc="Libraries of the fmodex audio engine"
arch=('i686' 'x86_64')
url="http://www.fmod.org/"
license=('custom')
conflicts=('fmodex')

DLAGENTS+=("fmod::/usr/bin/echo Could not find %u. Please register/log in at http://www.fmod.org/download-previous-products/ and download it to \"$(pwd)\"")

source=("fmod://fmodapi${pkgver//./}linux.tar.gz")
sha512sums=('64e28a11e2654615e96790d0926430f233726607c2f74b7223d10e5616c9af6d82c161c83410c1a1658b02c24be8eed5003ff699d5c3ab75dd154a45ef66940c')

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
