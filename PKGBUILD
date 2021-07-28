# Maintainer: Jakob Englisch <jakob.englisch[at]gmail[dot]com>

pkgname=ionosctl-bin
pkgver=5.0.7
_build=${pkgver}
pkgrel=1
pkgdesc='IonosCTL is a tool to help you manage your Ionos Cloud resources directly from your terminal.'
url='https://github.com/ionos-cloud/ionosctl'
arch=('x86_64')
license=('unknown')
conflicts=()

source_x86_64=("$pkgname-$pkgver::https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('5699325d140268be1ef2db0dbb0099f03249ea87414799cc420d88e7aee4aa39')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/ionosctl ${pkgdir}/usr/bin/ionosctl

    "$pkgdir/usr/bin/ionosctl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ionosctl"
    "$pkgdir/usr/bin/ionosctl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ionosctl"
}
