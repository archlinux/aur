# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=rosella
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight ircd"
arch=('x86_64' 'i686')
url="http://github.com/eXeC64/Rosella"
license=('AGPL')
makedepends=('go' 'git')
source=("$pkgname::git://github.com/eXeC64/Rosella.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
