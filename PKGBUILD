# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=elfy
pkgver=0.1.0
pkgrel=2
pkgdesc='Display information about ELF files'
arch=(x86_64)
url="https://github.com/xfgusta/$pkgname"
license=(MIT)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('85863295090cc7dfa5d21296d3c1fc343d09560b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -D -m 0644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

