# Maintainer: Phosphenius <luca dot kredel at web dot de>
pkgname=sp9k
pkgver=0.1.1
pkgrel=2
pkgdesc="A bullet hell/space shooter game made in C++ and SFML as a learning project."
arch=('x86_64')
url="https://github.com/Phosphenius/sp9k"
license=('MIT')
depends=('sfml>=2.5.1')
conflicts=(sp9k-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Phosphenius/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1ad30e2032fa2838b07663b95ff5b7230a70b616140c57214ac97e492594bed85bf846954b5fc4b853385be9444fa53f83c237243305b2e7c4e41315b5f64d64')

build() {
  cd "$pkgname-$pkgver"

  make ASSETDIR=/usr/share/"$pkgname" VERSION="$pkgver" release
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
