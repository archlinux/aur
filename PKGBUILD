# Maintainer: Linus Probert <ekliptor@gmail.com>
pkgname=mon
pkgver=2.0.5
pkgrel=1
pkgdesc="Filesystem change monitor that triggers shell commands"
arch=('x86_64')
url="https://github.com/LiquidityC/mon"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d9d6d00c32c4d8eadd65600006921bb52a17b6d15bbf3f532a13a6f06e0499ab')

build() {
    cd "$pkgname-$pkgver"
    make RELEASE_BUILD=1 GIT_TAG="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 mon "$pkgdir/usr/bin/mon"
    install -Dm644 doc/man/mon.1 "$pkgdir/usr/share/man/man1/mon.1"
}
