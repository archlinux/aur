# Maintainer: aethstetic <aethstetic@users.noreply.github.com>
pkgname=vex-shell
_pkgname=vex
pkgver=0.1.0
pkgrel=1
pkgdesc='A typed shell with structured data pipelines, written in C'
arch=('x86_64' 'aarch64')
url='https://github.com/aethstetic/vex'
license=('MIT')
depends=('glibc')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=vex.install

build() {
    cd "$_pkgname-$pkgver"
    make PREFIX=/usr
}

check() {
    cd "$_pkgname-$pkgver"
    make test
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
