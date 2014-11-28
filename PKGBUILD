# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=exiftags
pkgver=1.01
pkgrel=1
pkgdesc="Parses a JPEG file looking for Exif (Exchangeable Image File) data, formatting, and printing image properties."
arch=('i686')
url="http://johnst.org/sw/exiftags/"
license=('BSD')
depends=('glibc')
source=(http://johnst.org/sw/exiftags/$pkgname-$pkgver.tar.gz)

md5sums=('9d5bce968fdde2dc24ba49c0024dc0cc')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  install -d "$startdir/pkg/usr/bin" "$startdir/pkg/usr/share/man/man1"

  ./configure --prefix=/usr
  make || return 1
  make prefix="$startdir/pkg/usr" mandir="$startdir/pkg/usr/share/man" install
}
