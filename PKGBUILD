# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Maintainer: Marcus Kida <reinigt.chintz.0n@icloud.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=7.3.1
pkgrel=2
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('MIT')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('dc6d736b95d3058906b8082b31112322220eedba073eafcbf30f6cf6c8d39d89')
depends=('webkit2gtk>=2.46.3')
package() {
    cd "$srcdir"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
