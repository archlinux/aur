# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu-bin
pkgver=0.6.0
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
sha256sums_x86_64=('8641acdbbc91bae6f6e60bfff5a17e3dcc466c31e30bd2906edc128f9acd59c9')
sha256sums_aarch64=('e203465df8b2eff4dbc2ef49757c88d4db195973fae70dd62d37bfa11942dd2e')

package() {
    cd "dfdu-$CARCH-unknown-linux-musl"
    install -Dm755 dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}
