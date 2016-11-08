# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=ttygif
pkgver=1.4.0
pkgrel=1
pkgdesc='Convert terminal recordings to animated gifs'
arch=('x86_64')
url=https://github.com/icholy/ttygif
license=('MIT')
depends=('gcc' 'imagemagick' 'ttyrec' 'xorg-xwd')
source=("ttygif-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('949fe5029978888b4c7fed18f05d4df111c45f0eb29adb517e360d0086135d20781ef9509258fe54b45073fadebd4129647585d300c36d6ab966297741d88f66')

build() {
  cd ttygif-$pkgver
  make
}

package() {
  cd ttygif-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ttygif/LICENSE
  install -Dm755 ttygif "$pkgdir"/usr/bin/ttygif
}
