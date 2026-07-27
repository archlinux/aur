# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=cloudctl-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='A command line tool for FI-TS k8s services'
url='https://github.com/fi-ts/cloudctl'
license=('MIT')
arch=('x86_64')
provides=('cloudctl')
source_x86_64=("cloudctl-linux-$pkgver-$pkgrel::https://github.com/fi-ts/cloudctl/releases/download/v$pkgver/cloudctl-linux-amd64")
sha512sums_x86_64=('a091969231af823b906c2239060189693fa534a3d30a3f98a434b70090f73117b4baa9ee4c4946f52ad9ab5488d78eb1d28b83a18bb9fb61e09eb7e4678905c4')

package() {
    install -Dm 755 "$srcdir/cloudctl-linux-$pkgver-$pkgrel" "$pkgdir/usr/bin/cloudctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/cloudctl" completion bash> "$pkgdir/usr/share/bash-completion/completions/cloudctl"
    "$pkgdir/usr/bin/cloudctl" completion zsh>  "$pkgdir/usr/share/zsh/site-functions/_cloudctl"
}
