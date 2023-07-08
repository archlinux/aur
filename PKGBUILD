# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=6.2.1
pkgrel=1
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('MIT')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('6692d6aefa2a9918e80294aa79942ac475b5acc1a14171584ebd3d1e05287008')

package() {
    cd "$srcdir"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
