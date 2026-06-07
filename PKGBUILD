# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=cronet-go-bin
_pkgver=148.0.7778.96-1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Go bindings for naiveproxy"
arch=("x86_64" "armv7h" "aarch64")
url='https://github.com/SagerNet/cronet-go'
license=("LicenseRef-cronet-go")
depends=("glibc" "libgcc")
provides=("libcronet.so")
options=(!debug)
source=("LICENSE")
source_x86_64=("libcronet-linux-$pkgver-x86_64.so::$url/releases/download/v$_pkgver/libcronet-linux-amd64.so")
source_armv7h=("libcronet-linux-$pkgver-armv7h.so::$url/releases/download/v$_pkgver/libcronet-linux-arm.so")
source_aarch64=("libcronet-linux-$pkgver-aarch64.so::$url/releases/download/v$_pkgver/libcronet-linux-arm64.so")
sha256sums=('2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')
sha256sums_x86_64=('dc7293a929dffa695aae1a89555e7366158fa0a3f40bbe3012d445bc05c99672')
sha256sums_armv7h=('40deac370a3257deff8d348382ce59a3948600e3d9f211215b0c453bab5d3657')
sha256sums_aarch64=('1518e73270c7b49694592bc0448ba1033a80ff4084bfb92cfa5baacec627bd9f')

package() {
    install -Dm644 "libcronet-linux-$pkgver-$CARCH.so" "$pkgdir/usr/lib/libcronet.so"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
