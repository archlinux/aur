# Maintainer: Federico Squartini <federico.squartini at gmail dot com>

pkgname=exercism
pkgver=3.0.10
pkgrel=1
pkgdesc="Command line client for https://exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
makedepends=('go')
source=("https://github.com/exercism/cli/archive/v${pkgver}.tar.gz")
sha256sums=('0dbb34ba3bb3571fbc75fa9f5cb0b061317589a98a1af12fe7318a2c4cdbda5b')

build() {
    cd $srcdir/cli-${pkgver}
    go build -o out/exercism exercism/main.go
}

package(){
    cd $srcdir/cli-${pkgver}
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 shell/exercism_completion.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
    install -D -m644 shell/exercism_completion.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
    install -D out/exercism "$pkgdir/usr/bin/exercism"
}
