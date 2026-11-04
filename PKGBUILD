# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu-bin
pkgver=0.5.2
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
sha256sums_x86_64=('8d262ed0a81e6cceeeaaacc31ee9021964b0a37785fb91c2229a298f3e28ca3d')
sha256sums_aarch64=('fb6595e92c3e7c7544e1ebc1bc277e48af56d78e66bb71c682e65aa480cf0f70')

package() {
    cd "dfdu-$CARCH-unknown-linux-musl"
    install -Dm755 dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}
