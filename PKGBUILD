# Maintainer Jonas Natzer <jonas.natzer@gmail.com>

pkgname=rumno
pkgver=v0.3
pkgrel=1
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Lightweight media notification manager written in Rust"
url="https://gitlab.com/natjo/rumno"
license=('GPL3')
source=("https://gitlab.com/natjo/rumno/-/archive/v0.3/rumno-v0.3.tar.gz")
md5sums=('4779d8e023f51718972d90b5c94dccdd')
depends=('dbus' 'gtk3')

build() {
    cd $pkgname-$pkgver
    cargo build --release
}

package() {
    install -Dm755 $srcdir/$pkgname-$pkgver/target/release/rumno $pkgdir/usr/bin/rumno
    install -Dm755 $srcdir/$pkgname-$pkgver/target/release/rumno-background $pkgdir/usr/bin/rumno-background
}
