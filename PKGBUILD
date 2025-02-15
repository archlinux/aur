# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Frank Carlyle McLaughlin <frank@frankspace.com>

pkgname=worker
pkgver=5.2.1
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('c946db2130247eb8bb4ab9101a9255c849cf84e297f80d0f4f61c95b8fb0cef797c8fe11bae3157ae8b9b5b6a36488b634e2461ce9b720ac90647eb9ed8ba359'
	    'd8bf9a3ca1a01f2af74226ada1719b1780702fe80f848881531b8da2ccf355972935863013e4a1ab777b06dc2b8dfae604e3dc4f008524cd269869510553c91f')

validpgpkeys=('F9299EE90A729029E71AF26B667132D0FBC52B37') # Ralf Hoffmann

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --enable-xft --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

