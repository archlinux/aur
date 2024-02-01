# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalcloud-cli-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A command line tool for metal-stack cloud services'
url='https://github.com/metal-stack-cloud/cli'
license=('MIT')
arch=('x86_64')
provides=('metalcloud-cli')
source=("metalcloud-cli-$pkgver-$pkgrel::https://github.com/metal-stack-cloud/cli/releases/download/v$pkgver/metal-linux-amd64")
md5sums=('ca858868e4825f7dba2b86fe041681d6')

package() {
    install -Dm 755 "$srcdir/metalcloud-cli-$pkgver-$pkgrel" "$pkgdir/usr/bin/metalcloud-cli"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalcloud-cli" completion bash > "$pkgdir/usr/share/bash-completion/completions/metalcloud-cli"
    "$pkgdir/usr/bin/metalcloud-cli" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metalcloud-cli"
}
