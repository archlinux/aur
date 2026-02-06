# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.7.0
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
sha256sums_x86_64=('8876f5682e9d3ffa0e984c140940d2661102e0b6f6ab4abfdefbb8fcaf80ed82')
sha256sums_aarch64=('b1f2602d8b0a9628167b609e108e5d1557b85297a50935cadbf7b3e508653141')

package() {
    cd "runa-linux-$CARCH"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/docs/$pkgname/"
}

