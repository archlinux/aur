# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalctl-bin
pkgver=0.11.8
pkgrel=1
pkgdesc='A command line tool for metal-stack services'
url='https://github.com/metal-stack/metalctl'
license=('MIT')
arch=('x86_64')
provides=('metalctl')
source=("metalctl-$pkgver-$pkgrel::https://github.com/metal-stack/metalctl/releases/download/v$pkgver/metalctl-linux-amd64")
md5sums=('881238217013c97fd5ce77d2bc82be10')

package() {
    install -Dm 755 "$srcdir/metalctl-$pkgver-$pkgrel" "$pkgdir/usr/bin/metalctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/metalctl"
    "$pkgdir/usr/bin/metalctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metalctl"
}
