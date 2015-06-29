# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sleepshell
pkgver=0.0.2
pkgrel=2
pkgdesc='Sleep Dummy Shell - a simple do-nothing, sleep-forever program that can be used as a login shell'
arch=('i686' 'x86_64')
url='http://www.mariovaldez.net/software/sleepshell/'
license=('GPL')
source=("http://www.mariovaldez.net/software/${pkgname}/files/${pkgname}_${pkgver}.tar.gz")
sha256sums=('6a5ca129cc01971341bcfe86ebb9ba750f6d004a7a2262b8685e7a036b30fac0')

build() {
	cd ${srcdir}/${pkgname}

	gcc ${CFLAGS} ${LDFLAGS} sleepshell.c -o sleepshell
}

package() {
	cd ${srcdir}/${pkgname}

	install -D -m0755 sleepshell ${pkgdir}/usr/bin/sleepshell

	install -D -m0644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
	install -D -m0644 readme.txt ${pkgdir}/usr/share/doc/${pkgname}/readme.txt
}

