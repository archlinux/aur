# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight"
pkgrel=1
pkgver=0.4.26
pkgdesc="A Rust based quick automation tool"
arch=("any")
url=https://packages.pipelight.dev/$pkgname-$pkgver-$pkgrel-any.pkg.tar.zst
license=('GPL2')
depends=(deno)
makedepends=(git make cargo)
provides=("pipelight")
conflicts=("pipelight-git")
source=($url)
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd $pkgname
  bin="target/release/$pkgname"
  install -Dm755 $bin -t $pkgdir/usr/bin
  install -Dm755 $bin-run -t $pkgdir/usr/bin
  install -Dm755 $bin-trigger -t $pkgdir/usr/bin
}

url() {
  https://packages.pipelight.dev/$pkgname-$pkgver-$pkgrel-any.pkg.tar.zst
}
