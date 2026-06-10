# Maintainer: Brian Crescimanno <brian.crescimanno[a]me.com>

pkgname="qbittorrent-tui"
pkgver=0.1.5
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
sha256sums=('1e8716c987ebb250dc04bfb86346ddc42207d25d1b0d7172c69c51b769c15aa1')

build() {
  cd ${_pkgsrc}
  make build
}

package() {
  install -Dm 755 ${srcdir}/${_pkgsrc}/bin/qbt-tui ${pkgdir}/usr/local/bin/qbt-tui
}

