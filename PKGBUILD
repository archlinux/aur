# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Maintainer: Marcus Kida <aur@kimar.mozmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=7.3.1
pkgrel=6
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('custom')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('83ae7bd762e124d4b686f40ef57a5cd2cab5b6a01c05177eb6ca5d25f309094f')
depends=('webkit2gtk')
package() {
    cd "$srcdir"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
