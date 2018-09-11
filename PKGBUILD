# Maintainer: Deian Stefan

pkgname=xwrits
pkgver=2.26
pkgrel=1
pkgdesc="reminds you to take wrist breaks "
arch=('any')
url="http://www.lcdf.org/xwrits/"
license=('GPLv2')
depends=()
makedepends=()
conflicts=()
source=("http://www.lcdf.org/xwrits/$pkgname-$pkgver.tar.gz")
sha256sums=('aaca4809b4cd62a627335ca14a231d4ab556fc872458bdb6fdbf6e76b103fed8')
sha512sums=('c8beeca957e41468d85819a7d6d4475c83a99735ff17d13d724658a421d1d3b9a15191ee8ab903104ab19b869a4832103dbe7d3ec2a9bf89ae95a7899e92f927')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
