# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=shell-piper
pkgver=0.5.1
pkgrel=1
pkgdesc='Write a temporary file and pass it to a program'
arch=('any')
url="https://github.com/Mrfiregem/shell-piper"
license=('GPL3')
depends=('python')
makedepends=('python-flit' 'python-installer')
provides=('shellpiper')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mrfiregem/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c48c77af76dd218e15b6d1423b9cd8aaec989f170c24486ab5b095ff9999263d')

build() {
  cd "$pkgname-$pkgver"
  flit build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
