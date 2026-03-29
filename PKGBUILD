# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.9.1
pkgrel=1
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
sha256sums_x86_64=('f184db9a04fbf0f1630afc51afb62e00fc567534836bafa1d1737aa530aa3762')
sha256sums_aarch64=('3c29ccb76c1b675d29591834353d2bfcffe63c2b0438048b55c246d6d1085ed0')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

