pkgname=open-in-native-client
pkgver=1.0.8
pkgrel=1
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
        '9f1130f32ceeef607e21f76fef986789d14e2d1c2795ce24e3c46dfa88d7bffb473ac68b36f9100c9459500e274cce068493d073500236a3587ee15cb75d9047')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
