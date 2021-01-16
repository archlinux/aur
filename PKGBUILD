# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Former maintainer: Bernhard Walle <bernhard at bwalle dot de>
# Contributor: Sergej Pupykin <pupykin dot s plus arch at gmail dot com>
# Contributor: Juergen Hoetzel <juergen at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

pkgname=xosview
pkgver=1.23
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
url="https://www.pogo.org.uk/~mark/xosview/"
arch=(i686 x86_64)
depends=('gcc-libs' 'hicolor-icon-theme' 'libxpm')
license=('GPL')
source=("https://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('960acb68a8668e936e8dc71cc4e3926d879f47559b4a5f64555bdcc676c6739d')

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
