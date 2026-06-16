# Maintainer: Maxim Dubrovsky <maxdubmors@gmail.com>

pkgname=kent-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Agentic Coding platform for Professional SWE work focusing on output quality"
arch=('x86_64')
url="https://github.com/respawn-llc/kent"
license=('AGPL-3.0-only')
depends=()
provides=("kent=${pkgver}")
conflicts=('kent')

_upstream_arch='amd64'
_archive="kent_${pkgver}_linux_${_upstream_arch}.tar.gz"
_binary="kent_${pkgver}_linux_${_upstream_arch}"

source=(
  "${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/respawn-llc/kent/releases/download/v${pkgver}/${_archive}"
)

sha256sums=('62889955fab41915d1824dbcfed59f56bd9b05403cafb489a1efece4a7ff2a3d')

package() {
  install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/kent"
}
