# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.44"
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
    "7c96e511f9c152ee74feb172b51daf97ca9a683fb9573dc9a862aa0267cc9a7c"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cicada/LICENSE"
}
