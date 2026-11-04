# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Disk usage browser for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/jordond/dfdu"
license=('MIT')
provides=('dfdu')
conflicts=('dfdu')
options=('!debug' '!strip')
source_x86_64=("$url/releases/download/v$pkgver/dfdu-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("$url/releases/download/v$pkgver/dfdu-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('939bda3096e9741ea7644b4f2cd89f1e3eab9db0b613b71aa0cb036f24b340f0')
sha256sums_aarch64=('83cd0fc6b900d7c510be50de67c4bcf3e32d6ffb21091c417fd1378ed579995f')

package() {
    cd "dfdu-$CARCH-unknown-linux-musl"
    install -Dm755 dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}
