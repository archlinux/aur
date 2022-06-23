# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=4.1.4
pkgrel=1
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('MIT')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('8e51e167011965c44ed108be021cfbca9e89bc03ce1d4e29edde9b2c257e1c9a')

package() {
    cd "$srcdir"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
