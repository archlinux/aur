_pkgname=auto-mcs
pkgname=$_pkgname-bin
pkgver=2.3
pkgrel=1
pkgdesc="Cross-platform Minecraft server manager"
arch=(x86_64 aarch64)
url="https://github.com/macarooni-man/$_pkgname"
license=("GPL-3.0-or-later")
source=(
    "$_pkgname.desktop"
    "$_pkgname.png"
)
sha256sums=(
    "7725eec5430c1047dfb29975b9824037ac73d22c92e07fce15ebba7b0c9b18f8"
    "0cbd55618dba89b1b9edcaef98b433276fa8e943941c7af1ff5013e5e47a3833"
)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-linux-$pkgver.zip")
sha256sums_x86_64=("7f120b5eefcce20758072a7495347c3f0c03da38e4b6a6383d5dc0a6f256411a")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-linux-arm64-$pkgver.zip")
sha256sums_aarch64=("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

package() {
    cd "${srcdir}"
    install -Dm644 $_pkgname.desktop "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    install -Dm644 $_pkgname.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm755 $_pkgname "${pkgdir}/usr/bin/$_pkgname"
}
