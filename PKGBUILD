# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=papa-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar (binary release)"
arch=('x86_64')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=("papa")
conflicts=("papa")
source=("$url/releases/download/v$pkgver/papa_$pkgver-1_amd64.deb")
sha256sums=('7742d4c499775417b61a1df12747053a83c985ee742f1576c6c34bac7f9abe5b')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  install -Dm755 usr/bin/papa -t "$pkgdir/usr/bin"
  cd usr/share/doc/papa
  install -Dm644 copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
