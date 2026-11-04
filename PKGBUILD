# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu-bin
pkgver=0.5.1
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
sha256sums_x86_64=('62a2611768135e33a437d8684a99f238242064730b1e97ab10766d50b9aadded')
sha256sums_aarch64=('d75f83fa57b4bf37219084b30e7a2b4db24f3e9e3e856a03703f1eb69da6286c')

package() {
    cd "dfdu-$CARCH-unknown-linux-musl"
    install -Dm755 dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}
