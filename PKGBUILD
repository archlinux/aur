# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=yj-rs
_pkgname=yj
pkgver=1.2.2
pkgrel=1
pkgdesc='Command line tool that converts YAML to JSON.'
arch=('i686' 'x86_64')
url="https://github.com/bruceadams/yj"
license=('Apache')
depends=()
optdepends=()
conflicts=('yj' 'yj-git' 'yj-rs-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('62a01f128b60fb8bcdd78dcb139a81161ad828c104609ad1c7f12d52323fe2fa')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
