# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Maintainer: Marcus Kida <aur@kimar.mozmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=7.4.2
pkgrel=7
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('custom')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('0454b0ba85673c5d82b130adec89f859ccde46f05126252561988ad80ab2d2e4')
depends=('webkit2gtk')
package() {
    cd "$srcdir"

    install -Dm644 "share/sdkmanager/acknowledgements.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
