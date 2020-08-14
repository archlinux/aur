# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalctl-bin
pkgver=0.8.3
pkgrel=1
pkgdesc='A command line tool for metal-stack services'
url='https://github.com/metal-stack/metalctl'
license=('MIT')
arch=('x86_64')
provides=('metalctl')
source=("https://github.com/metal-stack/metalctl/releases/download/v$pkgver/metalctl-linux-amd64")
md5sums=('e92ef3578e1a2520e65afe31e6bd1bb9')

package() {
    install -Dm 755 "$srcdir/metalctl-linux-amd64" "$pkgdir/usr/bin/metalctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalctl" completion > "$pkgdir/usr/share/bash-completion/completions/metalctl"
    "$pkgdir/usr/bin/metalctl" zsh-completion >  "$pkgdir/usr/share/zsh/site-functions/_metalctl"
}
