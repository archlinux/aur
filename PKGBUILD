# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=cloudflare-speed-cli-bin
_pkgname="${pkgname%-bin}"
pkgdesc="CLI for internet speed test via cloudflare"
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kavehtehrani/cloudflare-speed-cli"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('de5c34364247404f8fbb0224bdd4d8cfda06961153f3f7278fbb3b3d7a6680a2')
sha256sums_aarch64=('bbbd0446c57841e996eeb09178afb6fd6a679cf143e41805cd6ee4ad684539e7')

package() {
    cd "${_pkgname}-${CARCH}-unknown-linux-musl"
    install -Dm755 "${_pkgname}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
