# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=binfmt-wasm
pkgver=20250109
pkgrel=1
pkgdesc="Register wasmtime interpreter for wasm format"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('MPL2')
depends=('wasmtime')
source=("wasm.conf"
        "binfmt-wasmtime-wrapper")
b2sums=('53a650c0e5381b4b98541fee1fed8e950e028e65388ec5493b9010064429af23d194928b854e3128be8ba4ed9fe8a4287a480db7b8709049616458d9fa219480'
        '4eab85549930360e8705208189bf1cfa6753120162034bf00249b07b6573d3cadb211ee7c0fc1f0ddb056280fb5dd8c61064af16dd089da5b80fbc599d7d2510')

package() {
    install -Dm 755 "$srcdir/binfmt-wasmtime-wrapper" "$pkgdir/usr/bin/binfmt-wasmtime-wrapper"
    install -Dm 644 "$srcdir/wasm.conf" "$pkgdir/usr/lib/binfmt.d/wasm.conf"
}
