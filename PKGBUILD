pkgname=open-in-native-client
pkgver=0.9.6
pkgrel=1
pkgdesc="Native client for the Open In browser extension"
arch=(any)
url=https://add0n.com/open-in.html
license=(MPL2)
depends=(nodejs)
source=(
    https://github.com/andy-portmen/native-client/releases/download/$pkgver/linux.zip
    install.patch
)
b2sums=('5b4046a8cb556a2dd0c00800439c016c907bd64ce8fd8055441af225616c5752de12244883ce2e93bad5bd4d4f32524ff1048ce8b4eaa14e7466db1f6651d9c3'
        '3320f23defcc30bacfb2b0e64cb0f3bdb73eade12934f36cef56b2c688d5c4b68b8ed23a4dd927313568f713045ffeab4d1268d0c3f2edd644e61ff7111e3911')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
