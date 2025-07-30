# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Konstantin Rannev <konstantin.rannev@gmail.com>

pkgname=lsfg-vk-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=("x86_64")
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
    'vulkan-icd-loader'
    'bash'
    'gcc-libs'
    'gtk4'
    'libadwaita'
)
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/PancakeTAS/lsfg-vk/releases/download/v${pkgver}/lsfg-vk-${pkgver}.$CARCH.tar.zst"
        "LICENSE")
sha256sums=('7e31d6f39da271fbc50ae8a1b092cb874bc6664765d5b7359d38970057f5fcff'
            '81fd6d483875f1d1520fa327f2139eda0bae28106863953ec57171d60a356b2f')
install=lsfg-vk.install
options=(!strip)

package() {
    cd "$srcdir"

    # unpack the downloaded archive straight into pkgdir
    tar -xpf "lsfg-vk-${pkgver}.$CARCH.tar.zst" --no-same-owner --exclude='.PKGINFO' -C "$pkgdir"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
