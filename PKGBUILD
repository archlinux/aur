# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=cloudctl-bin
pkgver=0.15.6
pkgrel=1
pkgdesc='A command line tool for FI-TS k8s services'
url='https://github.com/fi-ts/cloudctl'
license=('MIT')
arch=('x86_64')
provides=('cloudctl')
source_x86_64=("cloudctl-linux-$pkgver-$pkgrel::https://github.com/fi-ts/cloudctl/releases/download/v$pkgver/cloudctl-linux-amd64")
sha512sums_x86_64=('6eaca7a1a0cd789cb13a86cd967a2821998563094016e6dd13ff0d44d49ce3235c400349de23c0900cae3bf3f6712f27ac9400a567e59a9e65ee662fb2ca60f2')

package() {
    install -Dm 755 "$srcdir/cloudctl-linux-$pkgver-$pkgrel" "$pkgdir/usr/bin/cloudctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/cloudctl" completion bash> "$pkgdir/usr/share/bash-completion/completions/cloudctl"
    "$pkgdir/usr/bin/cloudctl" completion zsh>  "$pkgdir/usr/share/zsh/site-functions/_cloudctl"
}
