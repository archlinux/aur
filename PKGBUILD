# Maintainer: Baron Hou <houbaron@gmail.com>

pkgname=archisteamfarm-bin
pkgver=3.4.0.2
pkgrel=1
pkgdesc="C# application that allows you to farm steam cards using multiple steam accounts simultaneously."
arch=('x86_64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=("Apache License 2.0")
makedepends=("unzip")
noextract=('ASF-linux-x64.zip')
options=("!strip")

source=(
    "https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip"
    "LICENSE-2.0.txt"
    "ArchiSteamFarm-bin.desktop"
)

md5sums=(
    '87814c775459eaa7e2c1078e47a52a77'
    '175792518e4ac015ab6696d16c4f607e'
    '98654afd36cae629f570ff0510669ba2'
)

prepare() {
    unzip ASF-linux-x64.zip
}

package() {
    install -Dm644 "LICENSE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "ArchiSteamFarm-bin.desktop" "${pkgdir}/usr/share/applications/ArchiSteamFarm-bin.desktop"

    install -Dm755 "ArchiSteamFarm" "${pkgdir}/opt/ArchiSteamFarm-bin/ArchiSteamFarm"
    cp -r "${srcdir}"/* "${pkgdir}/opt/ArchiSteamFarm-bin/"
}
