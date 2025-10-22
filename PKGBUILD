# Maintainer: tee < teeaur at duck dot com >
pkgname=wasmcloud-bin
pkgver=1.9.0
pkgrel=2
pkgdesc="Build, manage, and scale Wasm apps across any cloud, K8s, or edge"
arch=(x86_64)
provides=(wasmcloud)
conflicts=(wasmcloud)
url="https://wasmcloud.com"
_git="https://github.com/wasmCloud/wasmCloud"
license=("Apache-2.0")
source=("$_git/raw/v$pkgver/LICENSE")
_exe="$pkgname-$arch-$pkgver"
source_x86_64=("$_exe::$_git/releases/download/v$pkgver/wasmcloud-x86_64-unknown-linux-musl")
sha256sums=('0d7e475818c32a6bad4c0715b1f23848d7e3544774e7d92d4797e076d80f3e04')
sha256sums_x86_64=('42030a6a56213312a65ba61b845164fbf1b1add0cf84d0d63a5fe3d5f93b3359')

package() {
    install -Dm755 "$_exe" "$pkgdir/usr/bin/wasmcloud"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
