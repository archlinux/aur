# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=consoletype
_pkgname=gentoo-functions
pkgdesc="print type of the console connected to standard input"
pkgver=0.12
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url="https://packages.gentoo.org/packages/sys-apps/gentoo-functions"
license=('GPL')
makedepends=('gcc' 'git')
source=("git+https://github.com/gentoo/gentoo-functions")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    make
}

package() {
	cd ${srcdir}/${_pkgname}
	install -Dm755 ${srcdir}/${_pkgname}/consoletype ${pkgdir}/usr/bin/consoletype
	install -Dm644 ${srcdir}/${_pkgname}/consoletype.1 ${pkgdir}/usr/share/man/man1/consoletype.1
}
