pkgname=bzip
pkgver=0.21
pkgrel=1
pkgdesc='A high-quality data compression program'
arch=('x86_64')
url='https://sourceware.org/bzip2/'
license=('GPL')
depends=()
source=('https://sourceware.org/pub/bzip2/bzip-0.21.tar.gz')
sha512sums=('dcaffbab9ff8bf8246c77a597f928d4aa05ea294b3a527626a36ba2c57bd1ec99b423feaf0ee6b3861be4ee3cbab83ed6f6bcfdd0f52e85fae293ff9e66e9a91')

build() {
  cd "$srcdir/bzip-0.21"
  make
}

package() {
  cd "$srcdir/bzip-0.21"
  install -Dm755 bzip "$pkgdir/usr/bin/bzip"
  install -Dm755 bunzip "$pkgdir/usr/bin/bunzip"

  install -Dm644 bzip.1 "$pkgdir/usr/share/man/man1/bzip.1"
  ln -sf bzip.1 "$pkgdir/usr/share/man/man1/bunzip.1"
}
