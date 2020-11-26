# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=yj-rs
_pkgname=yj
pkgver=1.1.32
pkgrel=1
pkgdesc='Command line tool that converts YAML to JSON.'
arch=('i686' 'x86_64')
url="https://github.com/bruceadams/yj"
license=('Apache')
depends=()
optdepends=()
conflicts=('yj')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('63d3598337589406bea5f5782313414646b1027f458ce914f63311ee0556994f')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
