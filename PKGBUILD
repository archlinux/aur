# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pngslice
pkgver=0.66
pkgrel=1
pkgdesc="The program performs this slicing for png images and writes a fragment of html to handle the image inclusion."
arch=('i686' 'x86_64')
url="http://sview01.wiredworkplace.net/pub/jjg/en/code/pngslice.html"
license=('GPL')
depends=('libpng')
source=(http://sview01.wiredworkplace.net/pub/jjg/code/$pkgname.tar.gz)

md5sums=('816313410dee225f417765b1af0e6186')

build() {
  cd "${srcdir}/$pkgname"

  ./configure --prefix=/usr
  make || return 1
# doesn't work yet:  make DESTDIR="${pgkdir}" install

  install -D -m755 "src/$pkgname" "${pkgdir}/usr/bin/$pkgname" || return 1
  install -D -m644 "src/$pkgname.1" "${pkgdir}/usr/share/man/man1/$pkgname.1" || return 1
}
