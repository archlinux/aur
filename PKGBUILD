# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=exec-as
pkgver=1
pkgrel=1
pkgdesc="A command that lets you start another command with any argv[0]"
arch=(i686 x86_64)
url="https://github.com/maandree/exec-as"
license=('GPL3')
depends=(glibc)
makedepends=(make coreutils gcc glibc)
#install=exec-as.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(7327f390331a02ea4b6b09d3ae2f379a70249a8741eb20a1c6a94ea6c512ed2d)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

