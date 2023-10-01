# Maintainer: MisconceivedSec (@misconceivedsec)
pkgname=salawat-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A prayer times (Adhan) app for Windows and GNU/Linux written in JavaFX"
arch=('x86_64')
conflicts=("salawat-appimage" "salawat")
provides=("salawat")
url="https://github.com/DBChoco/Salawat"
license=('MIT')
depends=('zstd' 'gtk3' 'alsa-lib' 'nss')
source=("Salawat-$pkgver-linux.tar.gz::https://github.com/DBChoco/Salawat/releases/download/v$pkgver/Salawat-$pkgver-linux.tar.gz")
md5sums=('c623351938306b5c437aa1d680004dab')

package()
{
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/Salawat" "${pkgdir}/opt/"
    sed -i "s/Salawat.png/icon.png/" "${srcdir}/Salawat/Salawat.desktop"
    install -Dm755 "${srcdir}/Salawat/Salawat.desktop" "${pkgdir}/usr/share/applications/salawat.desktop"
}
