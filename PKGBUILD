pkgname=open-in-native-client
pkgver=1.0.0
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
b2sums=('d14a6ca074c574fdac4d6dbd2f7251963894fd0ab570de5e42ce37b38fc89c44f93b1d99f1738544c36daedd44a8d37234e65d2554961b0faaf04cb1f01d3812'
        '3320f23defcc30bacfb2b0e64cb0f3bdb73eade12934f36cef56b2c688d5c4b68b8ed23a4dd927313568f713045ffeab4d1268d0c3f2edd644e61ff7111e3911')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
