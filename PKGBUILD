# Maintainer: Maxim Dubrovsky <maxdubmors@gmail.com>

pkgname=ksrc-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="One-liner search and read for Gradle third-party dependency sources"
arch=('x86_64')
url="https://github.com/respawn-llc/ksrc"
license=('Apache-2.0')
depends=()
provides=("ksrc=${pkgver}")
conflicts=('ksrc')

_upstream_arch='amd64'
_archive="ksrc_${pkgver}_linux_${_upstream_arch}.tar.gz"
_binary="ksrc_${pkgver}_linux_${_upstream_arch}"

source=(
  "${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/respawn-llc/ksrc/releases/download/v${pkgver}/${_archive}"
)

sha256sums=('86a35c5f5f221729626a1d6cb79cc575dae6960db43f06337dc013975c89f6c3')

package() {
  install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/ksrc"
}
