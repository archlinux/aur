# Maintainer: Grant <grant@fig.io>

pkgname="cicada-bin"
pkgver="0.1.47"
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
    "adad9c7ab0657451a1f0a1498d7dad36c8709b5b913c94f906b21d521848eb77"
    "SKIP"
)

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 cicada "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cicada/LICENSE"
}
