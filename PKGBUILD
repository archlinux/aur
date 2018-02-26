# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.3.4
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'python' 'cmake' 'libxcb')
source=("https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1dfda8d72f4aead3c1fce5f2699821d8aed14921c5eede44f55ba0fc29eed2483feb66c1b4ef991d13b50e8e57fac6eda39b7f165726acc26970b576d510a240')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
