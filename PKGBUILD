# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pngslice
pkgver=0.66
pkgrel=2
pkgdesc="Slice a png image for text-flow in html"
arch=('i686' 'x86_64')
url="http://download.openpkg.org/components/versioned/pngslice/"
license=('GPL')
depends=('libpng')
source=(http://download.openpkg.org/components/versioned/$pkgname/$pkgname-20081018.tar.gz)
md5sums=('816313410dee225f417765b1af0e6186')

build() {
  cd "${srcdir}/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname"

# doesn't work yet:  make DESTDIR="${pgkdir}" install
  install -D -m755 src/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 src/$pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
}
