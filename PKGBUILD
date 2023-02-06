# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Former maintainer: Bernhard Walle <bernhard at bwalle dot de>
# Contributor: Sergej Pupykin <pupykin dot s plus arch at gmail dot com>
# Contributor: Juergen Hoetzel <juergen at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

pkgname=xosview
pkgver=1.24
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
url="http://www.pogo.org.uk/~mark/xosview/"
arch=(i686 x86_64)
depends=('gcc-libs' 'hicolor-icon-theme' 'libxpm')
options=('!debug')
license=('GPL')
source=("http://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6d486c1a5a590d440ee1e2e5b06cea6bdcda7da16ca68d80f368cdfc42d7acb9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr MANDIR=/usr/share/man
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} PREFIX=/usr MANDIR=/usr/share/man install 
}

# vim: ts=2 sw=2 et ft=sh
