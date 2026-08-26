# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=cloudctl-bin
pkgver=0.15.3
pkgrel=1
pkgdesc='A command line tool for FI-TS k8s services'
url='https://github.com/fi-ts/cloudctl'
license=('MIT')
arch=('x86_64')
provides=('cloudctl')
source_x86_64=("cloudctl-linux-$pkgver-$pkgrel::https://github.com/fi-ts/cloudctl/releases/download/v$pkgver/cloudctl-linux-amd64")
sha512sums_x86_64=('f56cd11a7475c74f2caabb4cc69db9815bd10b8722138b9fb46f5312ec0fd154e10ffbece59ceb6ba9d49b2eafa90ec2361dae733f0c6a585efbf3ba71f95e8b')

package() {
    install -Dm 755 "$srcdir/cloudctl-linux-$pkgver-$pkgrel" "$pkgdir/usr/bin/cloudctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/cloudctl" completion bash> "$pkgdir/usr/share/bash-completion/completions/cloudctl"
    "$pkgdir/usr/bin/cloudctl" completion zsh>  "$pkgdir/usr/share/zsh/site-functions/_cloudctl"
}
