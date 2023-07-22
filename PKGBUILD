# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=papa
pkgname=$_pkgname-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar (binary release)"
arch=('x86_64')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/papa_${pkgver}_amd64.deb")
sha256sums=('dce5b1d43206facb05d9660dc6a053674448d438f7dd6b55380190d61577f630')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  install -Dm755 usr/bin/papa -t "$pkgdir/usr/bin"
  cd usr/share/doc/papa
  install -Dm644 copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
