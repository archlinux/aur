# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=yaloco
pkgver=1.3.2
pkgrel=1
pkgdesc='Yet Another Log Colorizer'
arch=(x86_64)
url='https://github.com/xyproto/yaloco'
license=(MIT)
makedepends=(git go)
source=("git+$url#commit=88cb5e00cce2d6b8feb77591ce0cec5fd3e31b74") # tag: v1.3.2
b2sums=('SKIP')

build() {
  cd $pkgname
  ./static_linux.sh
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
