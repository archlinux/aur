# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=exiftags
pkgver=1.01
pkgrel=2
pkgdesc="Parses a JPEG file looking for Exif (Exchangeable Image File) data, formatting, and printing image properties."
arch=('i686' 'x86_64')
url="http://johnst.org/sw/exiftags/"
license=('BSD')
source=(http://johnst.org/sw/exiftags/$pkgname-$pkgver.tar.gz)
md5sums=('9d5bce968fdde2dc24ba49c0024dc0cc')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  make bindir="${pkgdir}"/usr/bin mandir="${pkgdir}"/usr/share/man install

#license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}/
  sed '1,33p;d' $pkgname.c > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
