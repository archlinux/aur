# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=strace-parser
pkgver=0.5.2
pkgrel=1
pkgdesc='Strace parser written in Rust'
arch=(i686 x86_64)
url=https://gitlab.com/gitlab-com/support/toolbox/strace-parser
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('c2146190945cac207580b6602f59abd1871f15896cbed394cfeda482620573e86c11880b7abfbcbf4c2065e6e52990eafc67146cbc1ad7bd2ff9bb6ba964d128')

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
