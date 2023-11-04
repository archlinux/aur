# Maintainer: tee < teeaur at duck dot com >
_pkgname=WasmEdge
pkgname=wasmedge-bin
pkgver=0.13.5
pkgrel=1
pkgdesc="WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime"
arch=(x86_64 aarch64)
provides=(wasmedge)
conflicts=(wasmedge)
url="https://wasmedge.org"
_url="https://github.com/WasmEdge/WasmEdge"
license=("APACHE 2.0")
source=("$_url/raw/$pkgver/LICENSE")
source_x86_64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_x86_64.tar.xz")
source_aarch64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_aarch64.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('03be8c0519d73db69a83c5313717eabdb6f0c1be635d105ac661c5a9e2c6f249')
sha256sums_aarch64=('7bb11c59887ae88c5e27574322bcace5c8d744ae32f14b95df90c61cfeca0e5d')

package() {
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${_pkgname,,}/
    cd $_pkgname-$pkgver-Linux
    install -Dm755 bin/${_pkgname,,} -t $pkgdir/usr/bin/
    install -Dm755 bin/${_pkgname,,}c -t $pkgdir/usr/bin/
    install -Dm755 lib64/libwasmedge.so.0.0.3 -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so.0 -t $pkgdir/usr/lib/
    install -D include/${_pkgname,,}/* -t $pkgdir/usr/include/
}
