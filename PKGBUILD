# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server-cp
pkgver=1.31.1_100
pkgrel=3
epoch=1
pkgdesc="This is a test, DO NOT install this"
conflicts=(code-server)
replaces=(code-server)
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
sha512sums=(SKIP)

build() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"
}

package() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cp code-server "$pkgdir"/usr/bin/code-server
  cp LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  chmod +x "$pkgdir"/usr/bin/code-server
}
