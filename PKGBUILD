# Maintainer: David Birks <david@tellus.space>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.34.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('59e5e581de5748cfc4797bc7ecebe22da559f18fc602c08de0de3e8e4ff469cb242489a0dea426f447c3fb8fe509175eb8e905e080dce0f8a980f5fa5b77a5a6')

package() {
    install -Dm 755 "$srcdir/doctl" "$pkgdir/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir/usr/bin/doctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/doctl"
    "$pkgdir/usr/bin/doctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_doctl"
}
