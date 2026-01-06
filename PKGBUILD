# Maintainer: tee < teeaur at duck dot com >
_pkgname=WasmEdge
pkgname=wasmedge-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime"
arch=(x86_64 aarch64)
provides=(wasmedge)
conflicts=(wasmedge)
url="https://wasmedge.org"
_url="https://github.com/WasmEdge/WasmEdge"
license=("Apache-2.0")
source=("$_url/raw/$pkgver/LICENSE")
source_x86_64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux_2_28_x86_64.tar.xz")
source_aarch64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux_2_28_aarch64.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('b5665773311b0611b375d7e71056ce7504c53762b1a9dc0f2bfa8170511d6e1a')
sha256sums_aarch64=('c000954d7095c3e4f26efa24a1fbbe2e2b74cdb9c3ceee1aa6ec08bf1013f833')

package() {
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname,,}/"
    install -Dm755 "bin/${_pkgname,,}" -t "$pkgdir/usr/bin/"
    install -Dm755 "bin/${_pkgname,,}c" -t "$pkgdir/usr/bin/"
    install -Dm755 lib64/libwasmedge.so.0.1.0 -t "$pkgdir/usr/lib/"
    cp -d lib64/libwasmedge.so -t "$pkgdir/usr/lib/"
    cp -d lib64/libwasmedge.so.0 -t "$pkgdir/usr/lib/"
    install -D "include/${_pkgname,,}"/* -t "$pkgdir/usr/include/"
}
