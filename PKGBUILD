# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Maintainer: Marcus Kida <aur@kimar.mozmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=8.2.1
pkgrel=9
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('custom')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('89e62b3bfa6f059ac13f1339fc9957ac2da54255d4b5d91335638de605596f24')
depends=('webkit2gtk')
package() {
    cd "$srcdir"

    install -Dm644 "share/sdkmanager/acknowledgements.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
