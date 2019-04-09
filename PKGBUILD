# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.15.0
pkgrel=2
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('76aef1b3f926c7a8457dd27670a30ecfe9eb70526f1811ca1c03228cc9e41b5308284eac549aab0db13ce15ac9bf3ae0caabc64f40356fcb70a88c212dc92d5c')

package() {
    install -Dm 755 "${srcdir}/doctl" "${pkgdir}/usr/bin/doctl"

    # Populate bash and zsh completions
    install -d 755 "$pkgdir/usr/share/bash-completion/completions"
    install -d 755 "$pkgdir/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/doctl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/doctl"
    "${pkgdir}/usr/bin/doctl" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_doctl"
}
