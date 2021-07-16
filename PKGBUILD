# Maintainer: JoaoCostaIFG <joaocosta.work@posteo.net>

pkgname=maww
pkgver=1.0.0
pkgrel=1
pkgdesc="Animated backgrounds on Linux"
arch=("x86_64")
url="https://github.com/JoaoCostaIFG/MAWW"
license=('MIT')
depends=("imlib2" "libx11")
source=(${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/JoaoCostaIFG/MAWW/releases/download/v${pkgver}/${pkgname}-${pkgver}.pkg.tar.zst)
sha512sums=('a648dcdc8f7b4eed7a9da5bbc9743f0a54f4c1b5e6e9b40e5518569385dd91e36612de3d91b7437eda5062b0678a086235ce4c357ad98320bee7fb81852859aa')

build() {
  cd "$pkgname-$pkgver"

  make PREFIX="/usr" maww
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
