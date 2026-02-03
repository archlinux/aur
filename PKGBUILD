# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.6.2
pkgrel=1
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
provides=('runa')
conflicts=('runa')
changelog=CHANGELOG.md
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/runa-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/runa-linux-aarch64.tar.gz")
sha256sums_x86_64=('db0cab73737d9418cdc7a142b9ef4eef5227ecb62188cbc417c13041ad525b40')
sha256sums_aarch64=('86ad8034762325240f2c9528128dff5453b7f38ab84f81932ecd974bb6225a82')

package() {
    cd "runa-linux-$CARCH"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/docs/$pkgname/"
}

