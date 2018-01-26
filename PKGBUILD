# Maintainer: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
pkgname=amp
pkgver=0.3.2
pkgrel=1
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url='https://github.com/jmacdonald/amp'
license=('GPL3')
depends=('libxcb')
makedepends=('rust' 'git' 'python' 'cmake' 'libxcb')
source=("https://github.com/jmacdonald/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e749ab0279b74206a07cf8c2574241b532771f44543f79a7922bb39f5ebe5c5ebd5daf00fd4e117c377a1261e97fae1bea1dccd03347a296c1e00ef55c792518')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/amp" "$pkgdir/usr/bin/amp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
