# Maintainer: Aaron Mueller <mail@aaron-mueller.de>
# Contributor: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=worker
pkgver=3.5.0rc1
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a1d2eee83ac6b21865e6e864e28dffd3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --enable-xft --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
