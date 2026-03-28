# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.8.0
pkgrel=3
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
provides=('runa')
conflicts=('runa')
changelog=CHANGELOG.md
source_x86_64=("$pkgname-$pkgver-x86_64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-aarch64-gnu.tar.gz")
sha256sums_x86_64=('da733457b590e9d746afdd6f89c1e68e79339518314fb0eb41ad3856252687f2')
sha256sums_aarch64=('293bafb5a817564ce626ebf95cca63aa32cb2b4baf59becfd6ce0039e05f4fa9')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

