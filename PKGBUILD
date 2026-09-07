# Maintainer: Kaz Walker <me@kaz.codes>
pkgname=garm-provider-incus-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Incus external compute provider for GARM (official binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/cloudbase/garm-provider-incus'
license=('Apache-2.0')
provides=('garm-provider-incus')
conflicts=('garm-provider-incus')
optdepends=('garm: GitHub Actions Runner Manager that consumes this provider'
            'incus: local Incus daemon for the provider to talk to')
options=('!strip' '!debug')
install="$pkgname.install"

source_x86_64=("garm-provider-incus-${pkgver}-linux-amd64.tgz::${url}/releases/download/v${pkgver}/garm-provider-incus-linux-amd64.tgz")
source_aarch64=("garm-provider-incus-${pkgver}-linux-arm64.tgz::${url}/releases/download/v${pkgver}/garm-provider-incus-linux-arm64.tgz")
sha256sums_x86_64=('1489b5f9b3f01528e338c604c13dabe8321ed6f1bc6de77c7344119d7731c43f')
sha256sums_aarch64=('667bc66828758711be51e928457b712ea460294f195b310cf1e93ed609c1e9af')

package() {
    # Tarball contains a single static binary. Installed into garm's default
    # external provider directory (owned by the garm package).
    install -Dm755 garm-provider-incus \
        "$pkgdir/opt/garm/providers.d/garm-provider-incus"
}
