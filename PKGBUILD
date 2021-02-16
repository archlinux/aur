# Maintainer: Emil Petersen <emil(at)saimor(dot)dk>
# Maintainer: Marius Kieler <aur(at)trixx(dot)auxera(dot)net>

pkgname=stavox-content-downloader
pkgver=4.1.13
pkgrel=1
epoch=1
pkgdesc="Application for downloading the necessary content to play on Stavox"
arch=("x86_64")
url="https://stavox.com/"
license=('Commercial')
depends=("p7zip" "electron>=11" "electron<12")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://stavox.com/downloader/linux-x64/${pkgname}-${pkgver}.tar.gz" "stavox-content-downloader" "stavox-content-downloader.desktop")
noextract=()
sha256sums=("57b20d17176e72f77f4658746b83e04b655ec77fc214faa742e123f409e591b3" "196481d9e76c15ce844defb5a025499d1bbd61900ffcd8a746f6f50d1872e688" "7e3d46ce1f716206b631d8ec4287f77f375569e2e5e41a4060c50ee2b12bdcef")
validpgpkeys=()

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png" "main/icon.png"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" "package.json"
    cp -r "main" "${pkgdir}/usr/share/${pkgname}"
    cp -r "renderer" "${pkgdir}/usr/share/${pkgname}"
}