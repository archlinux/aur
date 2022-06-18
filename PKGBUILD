# Maintainer: blallo@autistici.org
_ext="tar.gz"
pkgname=hetty
pkgver=0.7.0
pkgrel=1
pkgdesc="An HTTP toolkit for security research"
arch=(x86_64 arm64)
url="https://github.com/dstotijn/hetty"
license=(MIT)
depends=()
makedepends=(curl tar)
source=("$pkgname-$pkgver.$_ext::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_Linux_${arch}.${_ext}")
b2sums=('7960a8743e2071467628e9630c7616a3439d5d0a4d53f1602f2b37275252e8bce470bb1ed844cc241e07a8c6de06625467b83558594f99de7dd0a78d714f3415')

prepare() {
    tar zxvf "$pkgname-$pkgver.$_ext"
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p $pkgdir/usr/bin
    cp $pkgname $pkgdir/usr/bin/
}
