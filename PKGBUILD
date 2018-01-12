# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=alt
pkgver=3.0.0
pkgrel=1
pkgdesc='Command line utility that attempts to find the "alternate path" for the provided path'
arch=('i686' 'x86_64')
url="https://github.com/uptech/alt"
license=('MIT')
depends=()
conflicts=('alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b50f35aeff7a812b4e2078edce09692230c9f1ced8bb68342283ce45175d9f9a9b27c1c8eeaef43fd759f48679f04bf5d56ae6203891cb88db36f25ce6ba51c8')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
