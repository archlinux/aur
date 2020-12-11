# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=strace-parser
pkgver=0.7.0
pkgrel=1
pkgdesc='A tool to analyze raw strace data'
arch=(i686 x86_64)
url=https://gitlab.com/gitlab-com/support/toolbox/strace-parser
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('38078cca5e5c75eae5ea504b186c62e019e43c357ddd2e913565af04b687613f25c4c73d8ff3605a197a4c3d75dc4939d94daeec67cd84650d4d1267dc671fa4')

build() {
  cd $pkgname-v$pkgver
  cargo build --release
}

package() {
  cd $pkgname-v$pkgver
  install -D target/release/strace-parser -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
