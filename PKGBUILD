# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Chuck Atkins <chuckatkins@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrparci.net)

pkgname=libax25
pkgver=0.0.12_rc5
pkgrel=3
pkgdesc="Ham Radio - library for AX.25, ROSE, 6PACK, KISS and NETROM protocols."
arch=('i686' 'x86_64')
url="https://linux-ax25.in-berlin.de"
license=('LGPL-2.1-only')
depends=('glibc')
install=$pkgname.install
source=(https://web.archive.org/web/\
https://linux-ax25.in-berlin.de/pub/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver//_/-}

	./configure --prefix=/usr --sysconfdir=/etc || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver//_/-}

	make install DESTDIR=${pkgdir} || return 1
	make installconf DESTDIR=${pkgdir} || return 1
}
md5sums=('21e64a76d41f3129acc7b540730e2f4d')
sha256sums=('bf15791950ce1ebdfc37fe75d80ad9a6767e6bb1536d704da6848991cf4323df')
