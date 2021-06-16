# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=strace-parser
pkgver=0.7.2
pkgrel=1
pkgdesc='A tool to analyze raw strace data'
arch=(i686 x86_64)
url=https://gitlab.com/gitlab-com/support/toolbox/strace-parser
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('0cb2250127b35453c22469cff2e2ca9a093761019497b6ba7a2fa3de59bde0f0b9fad55ae03e3a707e5047e8873fa4af8cf46d7dcd7367e1a6bd2fa3fb2167b5')

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
