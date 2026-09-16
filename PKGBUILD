pkgname=open-in-native-client
pkgver=1.1.3
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
b2sums=('040a1d1d403baa9a3a15299a4c33799ffe309d91f19a6b76603741f5addcf48187f06c65a8884f73d54c4b91eb80edf206216e499ab7e26566fbb3bd9a36c0dc'
        'f1df5233a0dcf4ae2bbffa9dc65625bb8cde0e492c6c62594805bcbe0cf8f4ec1539ea1753de30a33b51e6c34bbc1b5d2e53b0ad9af261ef52c63e3e2ce5fe0b')

prepare() {
    cd app
    patch -p1 -i $srcdir/install.patch
}

package() {
    cd app
    node install.js --prefix-dir=$pkgdir --custom-dir=/usr/share
}
