# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=ttygif
pkgver=1.3.0
pkgrel=1
pkgdesc='Convert terminal recordings to animated gifs'
arch=('x86_64')
url=https://github.com/icholy/ttygif
license=('MIT')
depends=('gcc' 'imagemagick' 'ttyrec')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('18ed967723bacdc1ced6d8ff86bcb3385d940863b8bcb4d3f6b31344f035d7a9')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ttygif/LICENSE
  install -Dm755 ttygif "$pkgdir"/usr/bin/ttygif
}
