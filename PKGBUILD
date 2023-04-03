# Maintainer: Mahdi N. <mhdna@outlook.com>
# Upstream author :  Sergey Vlasov  <https://github.com/noscript/>

pkgname=xsmon
pkgver=0.3.r0.g7979a9b
pkgrel=1
pkgdesc='Extra small system monitor for X11'
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('MIT')
makedepends=('git')
depends=('libxcb')

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}
