# Maintainer: David Birks <david@tellus.space>

pkgname=doctl-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v${pkgver}/doctl-${pkgver}-linux-amd64.tar.gz")
sha512sums=('341f9ab6803e992ad14c62ad45498ad42d901d2764f05fe71c04e2923e3682cdd2584a2ac4a2392b673c4dc0588dfb470ae86435f1a74d85461a6ae1d5d8fad7')

package() {
    install -Dm 755 "$srcdir/doctl" "$pkgdir/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/doctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/doctl"
    "$pkgdir/usr/bin/doctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_doctl"
}
