# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalctl-bin
pkgver=0.18.10
pkgrel=1
pkgdesc='A command line tool for metal-stack services'
url='https://github.com/metal-stack/metalctl'
license=('MIT')
arch=('x86_64')
provides=('metalctl')
source_x86_64=("metalctl-$pkgver-$pkgrel::https://github.com/metal-stack/metalctl/releases/download/v$pkgver/metalctl-linux-amd64")
sha512sums_x86_64=('5448809769ae3eb007e70c8a6889caf61fde6d68adad31b0108cba860a507c89b535002d74e568fb413c5542421556d85cc0aa016c0da7b8e816859dcb42c545')

package() {
    install -Dm 755 "$srcdir/metalctl-$pkgver-$pkgrel" "$pkgdir/usr/bin/metalctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/metalctl"
    "$pkgdir/usr/bin/metalctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metalctl"
}
