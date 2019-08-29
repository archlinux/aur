# Maintainer: David Birks <david@tellus.space>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.29.1
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('d3aef0e3270cab77546de6197cafc79b048b230060629fdc87fb59a1c5eebff21430ac36517dc0e9f89fcdf9493da55deb6f95fde9e0fc116ee02bd1af6109d3')

package() {
    install -Dm 755 "$srcdir/doctl" "$pkgdir/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/doctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/doctl"
    "$pkgdir/usr/bin/doctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_doctl"
}
