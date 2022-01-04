pkgname=dura-git
_pkgname=dura
pkgver=0.1.0
pkgrel=1
pkgdesc='Dura is a background process that watches your Git repositories and commits your uncommitted changes'
arch=(x86_64)
url=https://github.com/tkellogg/dura
license=(Apache)
makedepends=(git cargo)
provides=(dura)
source=(git+$url)
sha512sums=('SKIP')

build() {
  cd $_pkgname
  cargo build --locked --release
}

package() {
  cd $_pkgname
  install -D target/release/dura -t "$pkgdir"/usr/bin
}
 
