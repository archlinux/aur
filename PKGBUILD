# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Former maintainer: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xosview
pkgver=1.22
pkgrel=1
pkgdesc="Displays system stats such as cpu, memory, swap, and network usage"
url="https://www.pogo.org.uk/~mark/xosview/"
arch=(i686 x86_64)
depends=('gcc-libs' 'hicolor-icon-theme' 'libxpm')
license=('GPL')
source=("https://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('901b75af2676b11b28b88f0c79c5bd0f4f01de4790c0c5385edf6d71aee1f83a')

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
