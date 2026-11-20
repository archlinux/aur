# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.15.7
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
sha256sums_x86_64=('60c8f98003324fe0932c6e34f1c7c631fe3b1b2e3dfd13f219fa03f27573e94e')
sha256sums_aarch64=('2781d81c681f7e2d1971aae9a0363c033fcedcbe9f2a8a95edc2ebb76c2044f3')
sha256sums_ppc64le=('1f8956604dbb455ff6a2c1a7a981de7ced8a76773b65ed5ad83bf501b03833c1')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 docs/config-reference/{display,editor,general,keys,theme,commands}.md -t "$pkgdir/usr/share/doc/$pkgname/config-reference/"
}

