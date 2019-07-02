# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli
pkgver=2.1.4
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
arch=('x86_64')
url="https://github.com/Byron/dua-cli"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/Byron/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('caba1fac9c893de8de64572808545321')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # TODO: add `--locked` when https://github.com/Byron/dua-cli/issues/20 is
    #       resolved and an appropriate release is issued.
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/dua" "$pkgdir/usr/bin/dua"
}
