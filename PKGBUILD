# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.jetpack.io/devbox/"
_ghurl="https://github.com/jetpack-io/devbox"
license=('Apache')
optdepends=(
    'docker'
    'nix'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('a5d0368af1079f228e6370279b9d6192deae94c9770936a250a0ae485e538920')
sha256sums_armv7h=('a5d0368af1079f228e6370279b9d6192deae94c9770936a250a0ae485e538920')
sha256sums_i686=('b211616bc3a2f5474f383fad507543b9f9ccfc49a96cd1d3798095799973123c')
sha256sums_x86_64=('a4df26e9ab479e69f7d7bb1913f78c2949ee553a08f6f2d43d51b23b510ad3ba')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}