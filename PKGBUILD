# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=totp
pkgver=0.1
pkgrel=3
pkgdesc="A tiny command line utility to generate OTP tokens"
arch=('x86_64')
url="https://github.com/angt/totp"
license=('BSD')
depends=()
makedepends=('git')
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m0755 -s "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
