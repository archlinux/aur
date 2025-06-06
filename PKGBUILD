pkgname=vitch
pkgver=0.2.0
pkgrel=1
pkgdesc="A stupidly simple system fetch that is inspired by Nitch! (Written in Vlang)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/Redefa/Vitch"
license=('ISC')
depends=('vlang')
makedepends=('git' 'vlang' 'clang')
source=("git+$url" "vitch.install")
md5sums=('SKIP' 'SKIP')
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname"
  v -prod -o vitch .
}

package() {
  install -Dm755 "$srcdir/$pkgname/vitch" "$pkgdir/usr/bin/vitch"
}
