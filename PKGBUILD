# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=cronet-go-bin
_pkgver=0.0.1-143.0.7499.109-1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Go bindings for naiveproxy"
arch=("x86_64" "armv7h" "aarch64")
url='https://github.com/SagerNet/cronet-go'
license=("LicenseRef-cronet-go")
depends=("glibc")
provides=("libcronet.so")
options=(!debug)
source=("LICENSE")
source_x86_64=("libcronet-linux-$pkgver-x86_64.so::$url/releases/download/v$_pkgver/libcronet-linux-amd64.so")
source_armv7h=("libcronet-linux-$pkgver-armv7h.so::$url/releases/download/v$_pkgver/libcronet-linux-arm.so")
source_aarch64=("libcronet-linux-$pkgver-aarch64.so::$url/releases/download/v$_pkgver/libcronet-linux-arm64.so")
sha256sums=('2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')
sha256sums_x86_64=('a1f047f430dd91052f4977c49636dc44d32f2e4d9dfe8e541db4bce8c3ea6b66')
sha256sums_armv7h=('bd1c4fb7df0c9e7948f0ab80709612b66f37a7998f27e2a6a49d1aceefa2d0f6')
sha256sums_aarch64=('e1b5230d741b1d2dca92dbc8f401919560d062d5d41e8a23f13928e761335b46')

package() {
    install -Dm644 "libcronet-linux-$pkgver-$CARCH.so" "$pkgdir/usr/lib/libcronet.so"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
