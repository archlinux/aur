# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=elfy
pkgver=0.2.0
pkgrel=1
pkgdesc='Display information about ELF files'
arch=(x86_64)
url="https://github.com/xfgusta/$pkgname"
license=(MIT)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('4e0acc9e09f3752cd3953a31cd9dfacf7cf15b41')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX='/usr' install
  install -D -m 0644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

