# Maintainer: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado-bin
pkgver=0.1.9
pkgrel=2
pkgdesc="A Rust todo-list manager with TUI, inspired by meowdo"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
provides=("nyado")
conflicts=("nyado")

if [[ "$CARCH" == "x86_64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-x86_64-unknown-linux-musl")
    sha256sums=('be01ba15971abddb10898c709582051f2890546047b8b0f35255c00318f75547')
elif [[ "$CARCH" == "aarch64" ]]; then
    source=("https://github.com/LeynTheCat/nyado/releases/download/v$pkgver/nyado-aarch64-unknown-linux-musl")
    sha256sums=('7695e1e1491d433b8e7f2081123656d5a3f470883089847fb927d52bbe4701f0')
fi

package() {
    cd "$srcdir"
    install -Dm755 "$(ls | grep -v '.sig$' | head -n1)" "$pkgdir/usr/bin/nyado"
}