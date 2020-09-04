# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=yj-rs
_pkgname=yj
pkgver=1.1.25
pkgrel=1
pkgdesc='Command line tool that converts YAML to JSON.'
arch=('i686' 'x86_64')
url="https://github.com/bruceadams/yj"
license=('Apache')
depends=()
optdepends=()
conflicts=('yj' 'yj-git' 'yj-rs-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('22ee4f8a4b9d853ffb931cf8532412b7db256f438e3b6952fc9481b166cb3060')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
