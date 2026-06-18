
pkgname=archisteamfarm-asf-bin

pkgver=6.3.6.1

pkgrel=1

pkgdesc="ArchiSteamFarm - Steam card/hours farming tool"

arch=('x86_64')

url="https://github.com/JustArchiNET/ArchiSteamFarm"

license=('Apache')

depends=()

provides=('archisteamfarm')

conflicts=('archisteamfarm-bin')

source=("ASF-linux-x64-${pkgver}.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip")

sha256sums=('SKIP')

noextract=("ASF-linux-x64-${pkgver}.zip")

package() {

    install -dm755 "$pkgdir/opt/asf"

    unzip -o "${srcdir}/ASF-linux-x64-${pkgver}.zip" -d "$pkgdir/opt/asf"

    chmod +x "$pkgdir/opt/asf/ArchiSteamFarm"

    install -dm755 "$pkgdir/usr/bin"

    ln -s /opt/asf/ArchiSteamFarm "$pkgdir/usr/bin/asf"

}

