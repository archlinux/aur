# Maintainer: WiRight <ruslan.mahin1@gmail.com>
# Dizoft Team

pkgname=dron
pkgver=1.3.2
pkgrel=1
pkgdesc="Small command line shell executor"
arch=('x86_64')
url="https://github.com/DizoftTeam/dron"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DizoftTeam/$pkgname/archive/$pkgver.tar.gz")
md5sums=('7873f97d101432c59778c0b884ab8296')

build() {
  cd "$pkgname-$pkgver"
  go build -o dron ./main.go
  ./dron -version
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/"dron "$pkgdir"/usr/local/bin/dron
}
