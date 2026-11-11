# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.15.6
pkgrel=1
pkgdesc="A fast and lightweight terminal file manager written in Rust"
arch=(x86_64 aarch64 ppc64le)
url="https://github.com/runa-fm/runa"
license=('Apache-2.0 OR MIT')
depends=(libgcc)
provides=(runa)
conflicts=(runa)
changelog=CHANGELOG.md
source_x86_64=("$pkgname-$pkgver-x86_64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-aarch64-gnu.tar.gz")
source_ppc64le=("$pkgname-$pkgver-ppc64le-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-ppc64le-gnu.tar.gz")
sha256sums_x86_64=('5900a2ffcace843cc8eb906af5e87629dcbfc367c26b628bbdccf7349ccf5163')
sha256sums_aarch64=('d494aa0c98dcf47da4d7e2afa4f37825faf9fb62fd8d2a76f22f04706e55fdc4')
sha256sums_ppc64le=('f49f622b5adbdfa4029a7ed3675cff7812e43fe04867d74c37851e577208dbf3')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 docs/config-reference/{display,editor,general,keys,theme,commands}.md -t "$pkgdir/usr/share/doc/$pkgname/config-reference/"
}

