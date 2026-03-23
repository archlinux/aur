_pkgname=auto-mcs
pkgname=$_pkgname-bin
pkgver=2.3.6
pkgrel=1
pkgdesc="Cross-platform Minecraft server manager"
arch=(x86_64 aarch64)
url="https://github.com/macarooni-man/$_pkgname"
license=("GPL-3.0-or-later")
source=(
    "$_pkgname.desktop"
    "$_pkgname.png"
)
sha256sums=('7725eec5430c1047dfb29975b9824037ac73d22c92e07fce15ebba7b0c9b18f8'
            '0cbd55618dba89b1b9edcaef98b433276fa8e943941c7af1ff5013e5e47a3833')
sha256sums_x86_64=('b019792a2ed2412498652d999eed8f776d6868b62a63fe0548fbe3ac4c8a4a98')
sha256sums_aarch64=('5d05f58547a18cf5a8c1ea01c0b14861d7b5caa1687f14a92548d4843673965d')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-linux-$pkgver.zip")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-linux-arm64-$pkgver.zip")

package() {
    cd "${srcdir}"
    install -Dm644 $_pkgname.desktop "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    install -Dm644 $_pkgname.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm755 $_pkgname "${pkgdir}/usr/bin/$_pkgname"
}
