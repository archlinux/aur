# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=cronet-go-bin
_pkgver=147.0.7727.49-1
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
sha256sums_x86_64=('55c35e93dff3ab2174b9a338adbc99f5bd1dc54347f8aa605f44f129db30dd80')
sha256sums_armv7h=('0a3142e1b019981992b28c7abe521c2a6d56f8cbfe3a2a0f4faa37acb90eb23e')
sha256sums_aarch64=('9c47a5d8377a6baa9fc6723b25a7f8d0a78dee0ed6fee41d29d43b278056263a')

package() {
    install -Dm644 "libcronet-linux-$pkgver-$CARCH.so" "$pkgdir/usr/lib/libcronet.so"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
