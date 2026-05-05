# Maintainer: InTeaReable <leyn.the.cat@gmail.com>
# Contributor: Alexey Neverov <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI, inspired by meowdo"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")
options=(!strip)

if [[ "$CARCH" == "x86_64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-x86_64-unknown-linux-musl")
    sha256sums=('97dccd0e03db6d39902beb90fc557f9f1621927f553e4240a13c464780e6bae2')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('2786e8f4245f0d46eac7084ab1703494d51c11ba9fb7e138a0787b1f2e7d3db3')
fi

package() {
    cd "$srcdir"
    install -Dm755 "${source##*/}" "$pkgdir/usr/bin/nyado"
}