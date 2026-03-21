# Maintainer: Linus Probert <ekliptor@gmail.com>
pkgname=mon
pkgver=2.0.5
pkgrel=1
pkgdesc="Filesystem change monitor that triggers shell commands"
arch=('x86_64')
url="https://github.com/LiquidityC/mon"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('47701944f8825612b2e1b2852b05611a59d81b33cb0947c5b17f4a53645fce5b')

build() {
    cd "$pkgname-$pkgver"
    make RELEASE_BUILD=1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 mon "$pkgdir/usr/bin/mon"
    install -Dm644 doc/man/mon.1 "$pkgdir/usr/share/man/man1/mon.1"
}
