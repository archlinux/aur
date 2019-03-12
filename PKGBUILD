# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server
pkgver=1.31.1_100
pkgrel=2
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
sha512sums=('9ca143aec2f33b5c0e4138d76c5182bd021efaed88c664f11e64c150cc3f9ca6e2648edc23d7431f4aeb509fa0bbf0a51d51898afcdc0cb964aa95ad8e601124')

build() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"
}

package() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
