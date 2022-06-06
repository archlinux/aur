# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: dianlujitao <dianlujitao at gmail dot com>
pkgname=consoletype
_pkgname=gentoo-functions
pkgdesc="print type of the console connected to standard input"
pkgver=0.15
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url="https://packages.gentoo.org/packages/sys-apps/gentoo-functions"
license=('GPL')
source=("https://github.com/gentoo/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('07857be94b12d984388efb3cce06034d1e26c516614e63f5bd5d01f4081d17d9')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
 	install -Dm644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
