# Maintainer: tee < teeaur at duck dot com >
pkgname=wasmcloud-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Build, manage, and scale Wasm apps across any cloud, K8s, or edge"
arch=(x86_64)
provides=(wasmcloud)
conflicts=(wasmcloud)
url="https://wasmcloud.com"
_src="https://github.com/wasmCloud/wasmCloud"
license=("Apache-2.0")
source=("$_src/raw/v$pkgver/LICENSE")
_exe="$pkgname-$arch-$pkgver"
source_x86_64=("$_exe::$_src/releases/download/v$pkgver/wasmcloud-x86_64-unknown-linux-musl")
sha256sums=('0d7e475818c32a6bad4c0715b1f23848d7e3544774e7d92d4797e076d80f3e04')
sha256sums_x86_64=('fabbad0c1b3bbd594f4d57d9accf0e69ddf49ec20a0798cc4250a14d62d09853')

package() {
    install -Dm755 "$_exe" "$pkgdir/usr/bin/wasmcloud"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
