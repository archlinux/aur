# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=gupper-ping
pkgver=1.c34da6b
pkgrel=1
pkgdesc="Just a ping thing."
arch=('x86_64' 'i686')
url="https://github.com/Stephen304/gupper-ping"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("$pkgname::git+https://github.com/Stephen304/gupper-ping.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$pkgname"

  go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
