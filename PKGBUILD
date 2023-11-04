pkgname=open-in-native-client
pkgver=0.9.5
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
b2sums=('8d238ab47bef51ef1d7b2ca56bafa66b670ff4f9d46dcd5c8a4a361d5f8adcf909be0c75980692a59831a289ee9437c0dd022d5f09f7784015c27ec9101f4244'
        '3320f23defcc30bacfb2b0e64cb0f3bdb73eade12934f36cef56b2c688d5c4b68b8ed23a4dd927313568f713045ffeab4d1268d0c3f2edd644e61ff7111e3911')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
