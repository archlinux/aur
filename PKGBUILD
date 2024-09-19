# Maintainer: tee < teeaur at duck dot com >
_pkgname=WasmEdge
pkgname=wasmedge-bin
pkgver=0.14.1
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
sha256sums_x86_64=('b676a6020638fdbe7786ad6474ed63fa97ba2abc25f496952ce1275eb7b90a03')
sha256sums_aarch64=('2f57d7710bb7abe9e15fd364c848543d93afdda4ee05db8d258f178cd07e15ef')

package() {
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${_pkgname,,}/
    cd $_pkgname-$pkgver-Linux
    install -Dm755 bin/${_pkgname,,} -t $pkgdir/usr/bin/
    install -Dm755 bin/${_pkgname,,}c -t $pkgdir/usr/bin/
    install -Dm755 lib64/libwasmedge.so.0.1.0 -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so.0 -t $pkgdir/usr/lib/
    install -D include/${_pkgname,,}/* -t $pkgdir/usr/include/
}
