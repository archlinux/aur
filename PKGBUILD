# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=yaloco
pkgver=1.3.6
pkgrel=1
pkgdesc='Yet Another Log Colorizer'
arch=(x86_64)
url='https://github.com/xyproto/yaloco'
license=(MIT)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('275f277497a0f38470f6a92d546990a1a484d20cce27ae3f743576e1029a7d2a91fe12243b54cce09b6a0c90738f5c0b677af1d69d9a523fb4da4d52b47d8be6')

build() {
  cd $pkgname
  ./static_linux.sh
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
