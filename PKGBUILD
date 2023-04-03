# Maintainer: mhdna <mhdna@outlook.com>
# Upstream author :  Sergey Vlasov  <https://github.com/noscript/>

pkgname=xkbmon
pkgver=0.4.r4.g298e3a7
pkgrel=1
pkgdesc='A versatile keyboard layout monitor for X11'
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
