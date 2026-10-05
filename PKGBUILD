# Maintainer: Brian Crescimanno <brian.crescimanno[a]me.com>

pkgname="qbittorrent-tui"
pkgver=0.1.6
pkgrel=1
pkgdesc="A terminal-based user interface for monitoring and managing qBittorrent."
arch=('x86_64')
url="https://github.com/nickvanw/qbittorrent-tui"
license=('MIT')

_pkgsrc="$pkgname-$pkgver"

depends=()
makedepends=(
  make
  go
)

provides=("$pkgname")

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba3f7ba0c636773ab5ddb0ab3176c45e6f0774f3f5a3daccf34ca4d9e57b2b88')

build() {
  cd ${_pkgsrc}
  make build
}

package() {
  install -Dm 755 ${srcdir}/${_pkgsrc}/bin/qbt-tui ${pkgdir}/usr/local/bin/qbt-tui
}

