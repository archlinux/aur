# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Konstantin Rannev <konstantin d0t rannev at gmail d0t com>

pkgname=lsfg-vk-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=("x86_64")
url="https://lsfg-vk.dev/"
license=('CC-BY-NC-ND-4.0')
depends=(
    'vulkan-icd-loader'
    'gcc-libs'
    'gtk4'
    'libadwaita'
    'hicolor-icon-theme'
)
makedepends=()
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("https://builds.lsfg-vk.dev/lsfg-vk-${pkgver}.tar.xz"
        "LICENSE")
sha256sums=('d8378b45d378150ea9aba803a0ba855d8ce91ad9b3366ee0eb2036b06b08380c'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')
install=lsfg-vk.install
noextract=("lsfg-vk-${pkgver}.tar.xz")
options=(!strip)

package() {
    cd "$srcdir"

    # unpack the downloaded archive straight into pkgdir
    install -d "$pkgdir/usr"
    tar -xpf "lsfg-vk-${pkgver}.tar.xz" --no-same-owner --exclude='.PKGINFO' -C "$pkgdir/usr"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
