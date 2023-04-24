# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.43"
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
    "bb5a7d0a801a29b67f7d2e350ba3342211a3ba83e4457ac551a7271f4e81dc27"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cicada/LICENSE"
}
