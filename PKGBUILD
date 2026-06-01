# Maintainer: Maxim Dubrovsky <maxdubmors@gmail.com>

pkgname=builder-cli-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI coding agent focused on output quality and long-running tasks"
arch=('x86_64')
url="https://github.com/respawn-llc/builder"
license=('AGPL-3.0-only')
depends=()
provides=("builder-cli=${pkgver}" "builder=${pkgver}")
conflicts=('builder-cli' 'builder')

_upstream_arch='amd64'
_archive="builder_${pkgver}_linux_${_upstream_arch}.tar.gz"
_binary="builder_${pkgver}_linux_${_upstream_arch}"

source=(
  "${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/respawn-llc/builder/releases/download/v${pkgver}/${_archive}"
)

sha256sums=('1635daf8a5158b6d5c2c70929195be3ee547f10266089c8ef3e65beb40391052')

package() {
  install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/builder"
}
