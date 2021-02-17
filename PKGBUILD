# Maintainer: Emil Petersen <emil(at)saimor(dot)dk>
# Maintainer: Marius Kieler <aur(at)trixx(dot)auxera(dot)net>

pkgname=stavox-content-downloader
pkgver=4.1.14
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
source=("${pkgname}-${pkgver}-aur.tar.gz::https://stavox.com/downloader/linux-x64/${pkgname}-${pkgver}-aur.tar.gz" "stavox-content-downloader" "stavox-content-downloader.desktop")
noextract=()
sha256sums=("eb6a58b635bcde2611869081880a2f0b4c6c2534352ac9f9ecff76353fd192e6" "a145e64d47c7af5c23c19919a7e17cedf8ad29b87513ecb0477c4ecb53150d93" "49f51ece84933f85aac4648c33fccfbce9bcd3fcaa587ff2975f368cea64c600")
validpgpkeys=()

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" "package.json"
    cp -r "main" "${pkgdir}/usr/share/${pkgname}"
    cp -r "renderer" "${pkgdir}/usr/share/${pkgname}"
    cp "./main/icon.png" "$pkgname.png"
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps" "$pkgname.png"
    rm "$pkgname.png"
}