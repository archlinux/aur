# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian A. Liem <sebastian@liem.se>
# Contributor: ava1ar <mail(at)ava1ar(dot)info> 

pkgname=yacpi
pkgver=3.0.1
pkgrel=4
pkgdesc="ncurses-based acpi monitor."
arch=('i686' 'x86_64')
url="http://www.ngolde.de/yacpi.html"
license=('GPL')
depends=('ncurses' 'libacpi')
source=(http://www.ngolde.de/download/${pkgname}-${pkgver}.tar.gz)
sha1sums=('4282cbdd546586e101c096d9fbf1445c31b62df8')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/bin
  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/
}
