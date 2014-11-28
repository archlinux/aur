# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=castget-unstable
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, command-line based RSS enclosure downloader"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/castget/"
license=('GPL')
provides=('castget')
conflicts=('castget')
depends=('glib2' 'libxml2' 'curl' 'id3lib')
source=(http://savannah.nongnu.org/download/castget/castget-$pkgver.tar.bz2)
md5sums=('8410fb01d1ff66125c60250398d8c565')

build() {
  cd "${srcdir}"/castget-$pkgver

  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}"/castget-$pkgver

  make DESTDIR="${pkgdir}" install
}
