# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=papa
pkgname=$_pkgname-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar (binary release)"
arch=('x86_64')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
_url2=https://raw.githubusercontent.com/AnActualEmerald/papa/72fbd2c09c0ca4eaa65499135ba760d6995a1f0d
source=("$url/releases/download/v$pkgver/papa_${pkgver}_amd64.deb")
sha256sums=('2fc0feac3b70bf2317335bc4dfd7ade4cdeb80daef24451d8603743f94f35bb0')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  install -Dm755 usr/bin/papa -t "$pkgdir/usr/bin"
  cd usr/share/doc/papa
  install -Dm644 copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
