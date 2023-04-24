# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="ain"
pkgrel="1"
pkgdesc="Write CI/CD Pipelines in TypeScript"
arch=("x86_64")
url="https://cicada.build"
license=("MIT")
depends=("docker" "deno" "buildkit")
provides=("cicada")
conflicts=("cicada")
source=(
    "$pkgname-$pkgver.tgz::https://github.com/cicadahq/cicada/releases/download/v${pkgver}/cicada-x86_64-unknown-linux-gnu.tar.gz"
    "https://raw.githubusercontent.com/cicadahq/cicada/v${pkgver}/LICENSE"
)
sha256sums=(
    "481b2cb024a24abc2a95bd24b13731eb9e58dfb3684c3bcf2352cc2ab697b67a"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cicada/LICENSE"
}
