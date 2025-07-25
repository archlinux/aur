# Maintainer: Ulrich Schreiner <ulrich.schreiner@gmail.com>

pkgname=metalctl-bin
pkgver=0.18.2
pkgrel=1
pkgdesc='A command line tool for metal-stack services'
url='https://github.com/metal-stack/metalctl'
license=('MIT')
arch=('x86_64')
provides=('metalctl')
source_x86_64=("metalctl-$pkgver-$pkgrel::https://github.com/metal-stack/metalctl/releases/download/v$pkgver/metalctl-linux-amd64")
sha512sums_x86_64=('08fc24dffd26425faedeba70313f92d2db4f9d83f21c2a813fd2b0381a9eeb9eaf93d00161111eab6aa2647e4a3eb99d35195c7ba81df703b88ae64d1c2ada35')

package() {
    install -Dm 755 "$srcdir/metalctl-$pkgver-$pkgrel" "$pkgdir/usr/bin/metalctl"

    # Populate bash, zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/metalctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/metalctl"
    "$pkgdir/usr/bin/metalctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_metalctl"
}
