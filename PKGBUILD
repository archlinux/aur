# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalcloud-cli-bin
pkgver=0.5.5
pkgrel=1
pkgdesc='A command line tool for metal-stack cloud services'
url='https://github.com/metal-stack-cloud/cli'
license=('MIT')
arch=('x86_64')
provides=('metal')
source=("metalcloud-cli-$pkgver-$pkgrel::https://github.com/metal-stack-cloud/cli/releases/download/v$pkgver/metal-linux-amd64")
md5sums=('0fa1e780704c90603f038cde17b20c62')

package() {
    install -Dm 755 "$srcdir/metalcloud-cli-$pkgver-$pkgrel" "$pkgdir/usr/bin/metal"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metal" completion bash > "$pkgdir/usr/share/bash-completion/completions/metal"
    "$pkgdir/usr/bin/metal" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metal"
}
