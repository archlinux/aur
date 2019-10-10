# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Former maintainer: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xosview
pkgver=1.21
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
url="https://www.pogo.org.uk/~mark/xosview/"
arch=(i686 x86_64)
depends=('gcc-libs' 'hicolor-icon-theme' 'libxpm')
license=('GPL')
source=("https://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('81a7c4dc2f8f41d0d061a50ca3bd86a7998a7a553cc82b5f73f0aaeb6cf0f502')

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
