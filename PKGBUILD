# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=2
pkgver=1.0.0
pkgdesc="Command line client for gofu"
url="https://git.roshless.me/~roshless/fup"
arch=("any")
license=("GPL")
depends=("curl")
source=("https://git.roshless.me/~roshless/$pkgname/archive/$pkgver.tar.gz")

build() {
    cd $pkgname-$pkgver
    make PREFIX="/usr"
}

package() {
    cd $pkgname-$pkgver

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

sha256sums=('bb2a31d29780b1d92714f80ba9a1624e8f0a1666656492faf47bd8642993e777')
