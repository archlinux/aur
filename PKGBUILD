# Maintainer: David Birks <david@birks.dev>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.39.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('d4400dfe4c6c628232ff42f3ccf2a078a33b30eb3acaea2e1ab0f37eb947b1bf842a9db61c1fba2ab9a01952f37c66c659a4527826e75bca856793da687c5844')

package() {
    install -Dm 755 "$srcdir/doctl" "$pkgdir/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/doctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/doctl"
    "$pkgdir/usr/bin/doctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_doctl"
}
