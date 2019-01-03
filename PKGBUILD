# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=sd
pkgver=0.4.2
pkgrel=1
pkgdesc='Intuitive find & replace'
arch=('i686' 'x86_64')
url="https://github.com/chmln/sd"
license=('MIT')
depends=()
conflicts=('sd-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('aaa4df1105b73fac5dd35610c1466f349ed4b4f50d453b11b2e435fee7e96df8')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
