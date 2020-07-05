# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/$pkgname"
license=('GPL-3.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('24c55b189c2eb5c54390f263730641c9eec4d461c341f063b0383e8a15e0869124d815a0532ca0a1aac02692ea89e30cf5a610f9231f996057bf8da75f098956')

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
