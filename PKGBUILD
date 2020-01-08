# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.5.0
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
depends=()
conflicts=('dtool-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b57c2f88a5a8d4a8af0d693c8e0c0af530432eb06b5780d8466bc46f7828022')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
