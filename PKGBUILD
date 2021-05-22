pkgname=website-stalker
pkgver=0.1.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/website-stalker"
license=('LGPL-2.1-or-later')
depends=('git')
makedepends=('cargo')

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('4a5e3103efbe05cbcf2acc262ed55c0face70904f19d5d8e98e26eaacc9c10e4')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 readme.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
