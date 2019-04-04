# Maintainer: Jim Verheijde <jimver1@hotmail.com>
pkgname=catsay
pkgver=v0.2.0.8.r11.g6abd981
pkgrel=1
pkgdesc="This is a useless cli tool of a cat echoing what you say."
url="https://github.com/Jimver/catsay"
license=('MIT')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git://github.com/Jimver/catsay.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    echo "$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/$pkgname/target/release/cat-say" "$pkgdir/usr/bin/catsay"
}
