# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.48"
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
    "7abfda9a7936fbd693b3cecf5022dba981b764d5a4fe25c1987247c6f2661470"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cicada/LICENSE"
}
