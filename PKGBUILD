# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalctl-bin
pkgver=0.18.6
pkgrel=1
pkgdesc='A command line tool for metal-stack services'
url='https://github.com/metal-stack/metalctl'
license=('MIT')
arch=('x86_64')
provides=('metalctl')
source_x86_64=("metalctl-$pkgver-$pkgrel::https://github.com/metal-stack/metalctl/releases/download/v$pkgver/metalctl-linux-amd64")
sha512sums_x86_64=('0dc6013ba792f152cfc5750868168756f445fcfee52475e22a2016ebb3425891696dcfebbc5011f77ea40a6d9d88a43e6b1ab0ca89761103684c480108f21b7a')

package() {
    install -Dm 755 "$srcdir/metalctl-$pkgver-$pkgrel" "$pkgdir/usr/bin/metalctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/metalctl"
    "$pkgdir/usr/bin/metalctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metalctl"
}
