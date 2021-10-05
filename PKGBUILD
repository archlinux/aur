# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt
pkgver=1.0.2
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
provides=('durt')
arch=('x86_64')
url="https://github.com/cauebs/$pkgname"
license=('GPL-3.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('473f5b87c4f4582c03241ce8db428af9906c31429f13de3cb20844018dfcc6846a50f4df670fd7458540331c151022e05d84f2056d8f5f6b3520ec56f7ece32a')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
