# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mon
pkgver=1.2.3
pkgrel=1
pkgdesc="Simple single-process process monitoring program written in C"
arch=('i686' 'x86_64')
url="https://github.com/visionmedia/mon"
license=('MIT')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/visionmedia/mon/archive/$pkgver.tar.gz")
sha256sums=('978711a1d37ede3fc5a05c778a2365ee234b196a44b6c0c69078a6c459e686ac')

build() {
  make -C mon-$pkgver
}

package() {
  cd mon-$pkgver

  install -Dm755 mon "$pkgdir"/usr/bin/mon
  install -d "$pkgdir"/usr/share/doc/mon
  cp -r example *.md "$pkgdir"/usr/share/doc/mon
}
