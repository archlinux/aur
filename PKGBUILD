# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Chuck Atkins <chuckatkins@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrparci.net)

pkgname=libax25
pkgver=0.0.12_rc4
pkgrel=1
pkgdesc="Ham Radio - library for AX.25, ROSE, 6PACK, KISS and NETROM protocols."
arch=('i686' 'x86_64')
url="http://www.linux-ax25.org"
license=('LGPL')
depends=('glibc')
install=$pkgname.install
source=(http://www.linux-ax25.org/pub/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz)

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
md5sums=('9b2e6890ef20dd0cf8ac7fdb22e6a4b6')
sha256sums=('051bd736c3f3f3b242b3efea91af37f2e8d5afaebb5fe6e1df050bb1f6aeb986')
