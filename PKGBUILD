# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname=cronet-go-bin
_pkgver=143.0.7499.109-2
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
source_x86_64=("libcronet-linux-$pkgver-x86_64.so::$url/releases/download/$_pkgver/libcronet-linux-amd64.so")
source_armv7h=("libcronet-linux-$pkgver-armv7h.so::$url/releases/download/$_pkgver/libcronet-linux-arm.so")
source_aarch64=("libcronet-linux-$pkgver-aarch64.so::$url/releases/download/$_pkgver/libcronet-linux-arm64.so")
sha256sums=('2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')
sha256sums_x86_64=('436fbbea68293ca4b844e0d24bd61dc7e7d55ef08af47ab85b6d0f99f05f2129')
sha256sums_armv7h=('d82e7eafb94664f9ca9a14dee38b8a5c569e31a77e6c3728ab3d80856b8e6146')
sha256sums_aarch64=('288341d94a086696e586002044f3167b4930867458d96741e19e8046429ae45c')

package() {
    install -Dm644 "libcronet-linux-$pkgver-$CARCH.so" "$pkgdir/usr/lib/libcronet.so"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
