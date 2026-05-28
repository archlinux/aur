pkgname=open-in-native-client
pkgver=1.0.8
pkgrel=2
pkgdesc="Native client for the Open In browser extension"
arch=(any)
url=https://add0n.com/open-in.html
license=(MPL2)
depends=(nodejs)
source=(
    https://github.com/andy-portmen/native-client/releases/download/v$pkgver/linux.zip
    install.patch
)
b2sums=('59d42614494610242153775bed30f3bba1db9526b6a592b55a9b24339e116ae45d11a9a5073384f5d052189da7a503aa7a68adfeb9d4edf6e725656db1391e8d'
        '640166ce5f8f4c93e3d07edf38d76c753ddb4611cdafeca61ef358c41bad5c152ce5d261b2733d8aa36ab91f31a12b6cdd2470f833affa5215bc8d36ae23f033')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
