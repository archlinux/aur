# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight"
pkgver="0.4.22"
pkgrel=1
pkgdesc="A Rust based quick automation tool"
arch=(x86_64)
url="https://gitea.com/pipelight/pipelight.git"
license=('GPL2')
depends=(deno)
makedepends=(git make cargo)
provides=("pipelight")
conflicts=("pipelight")
source=(git+$url)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  bin="target/release/$pkgname"
  install -Dm755 $bin -t $pkgdir/usr/bin
  install -Dm755 $bin-run -t $pkgdir/usr/bin
  install -Dm755 $bin-trigger -t $pkgdir/usr/bin
}
