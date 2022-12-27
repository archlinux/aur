# Maintainer: Jan de Groot <jgc@archlinux.org
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Tanguy Bouzéloc <the.zauron at gmail dot com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>

pkgname=autoconf2.13
pkgver=2.13
pkgrel=7
pkgdesc="A GNU tool for automatically configuring source code (Legacy 2.1x version)"
arch=(any)
url="https://www.gnu.org/software/autoconf/"
license=('GPL2')
depends=('perl')
source=(https://ftp.gnu.org/gnu/autoconf/autoconf-${pkgver}.tar.gz)
sha256sums=('f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e')

build() {
  cd "${srcdir}/autoconf-${pkgver}"
  ./configure --prefix=/usr --infodir=/usr/share/info --program-suffix=-2.13
  make
}

package() {
  cd "${srcdir}/autoconf-${pkgver}"
  make prefix="${pkgdir}/usr" infodir="${pkgdir}/usr/share/info" install
  mv "${pkgdir}"/usr/share/info/autoconf{,-2.13}.info
  mv "${pkgdir}"/usr/share/info/standards{,-2.13}.info
}
