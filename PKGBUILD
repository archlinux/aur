pkgname=echo-ft
pkgver=b3
pkgrel=1
pkgdesc='Lightweight, peer-to-peer (P2P) file transfer system designed for reliability, speed, and simplicity'
arch=('x86_64')
url="https://github.com/IdanKoblik/Echo"
license=('MIT')
makedepends=('go' 'git')
source=(
  "$pkgname::https://github.com/IdanKoblik/Echo/releases/download/2025-$pkgver/echo-linux-amd64-1.23"
  "echo.1::https://raw.githubusercontent.com/IdanKoblik/Echo/main/echo.1"
  "LICENSE::https://raw.githubusercontent.com/IdanKoblik/Echo/main/LICENSE"
)
sha256sums=('SKIP' 
            'c3096a9d218e9951512e05ed3567ead570f37b56c3aee3befd63c73b71846653' 
            '9df5ca186644cd5df653d220862cc59854c2d09fb69109e5154025edcd5ab673')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/echo-ft"
  install -Dm644 "$srcdir/echo.1" "$pkgdir/usr/share/man/man1/echo-ft.1"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
