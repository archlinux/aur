# Maintainer: Brian Crescimanno <brian.crescimanno[a]me.com>

pkgname="qbittorrent-tui"
pkgver=0.1.3
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
sha256sums=('5a2a616be4afef6c8633e272da55bfde925b719bbd97e0f325b2d8f340f9b1b7')

build() {
  cd ${_pkgsrc}
  make build
}

package() {
  install -Dm 755 ${srcdir}/${_pkgsrc}/bin/qbt-tui ${pkgdir}/usr/local/bin/qbt-tui
}

