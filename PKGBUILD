# Maintainer: Jan de Groot <jgc@archlinux.org
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Tanguy Bouzéloc <the.zauron at gmail dot com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>

pkgname=autoconf2.13
pkgver=2.13
pkgrel=1
pkgdesc="A GNU tool for automatically configuring source code (Legacy 2.1x version)"
arch=(any)
url="http://www.gnu.org/software/autoconf/"
license=('GPL2')
depends=('perl')
install=autoconf.install
source=("http://ftpmirror.gnu.org/autoconf/autoconf-${pkgver}.tar.gz")
md5sums=('9de56d4a161a723228220b0f425dc711')

build() {
   cd "$srcdir/autoconf-${pkgver}"
   ./configure --prefix=/usr --infodir=/usr/share/info --program-suffix=-2.13 || return 1
   make || return 1
   make prefix="${pkgdir}/usr" infodir="${pkgdir}/usr/share/info" install || return 1
   mv "${pkgdir}"/usr/share/info/autoconf{,-2.13}.info
   mv "${pkgdir}"/usr/share/info/standards{,-2.13}.info
}
