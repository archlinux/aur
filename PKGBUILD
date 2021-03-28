# Maintainer: lmartinez-mirror
pkgname=afetch
pkgver=2.1.0
pkgrel=1
pkgdesc="A fetch program written in C"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://github.com/13-CF/afetch"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('cd6a6abdabf954395c1434f79e7d71646a015451fa3d69ba8d102d994eb8071e')

build() {
  cd "$pkgname-$pkgver"
  printf ":: If $pkgname fails to compile, check that you have a libc installed with pthread support.\n"
  make CFLAGS="${CFLAGS} -std=c99" LDFLAGS="${LDFLAGS} -lpthread" all
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin/"
}
