# Maintainer: Vincent Loupmon <vloupmong@gmail.com>

pkgname=slit
pkgver=1.2.0
pkgrel=2
pkgdesc="A modern PAGER for viewing logs, get more than most in less time. Written in Go"
arch=('x86_64' 'i686')
url="https://github.com/tigrawap/slit"
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git')
options=('!strip')
source=("git+https://github.com/tigrawap/slit#commit=f1d770e")
md5sums=('SKIP')
_gourl=github.com/tigrawap/slit

pkgver() {
  cd slit
  git describe --tags | tr - .
}

build() {
  cd "$pkgname"
  go build $_gourl/cmd/slit
}

package() {
  install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "$srcdir"/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
}
