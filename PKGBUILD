# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=shell-piper
pkgver=0.7.0
pkgrel=1
pkgdesc='Write a temporary file and pass it to a program'
arch=('any')
url="https://github.com/Mrfiregem/shell-piper"
license=('GPL3')
depends=('python' 'python-rich')
makedepends=('python-flit' 'python-installer')
provides=('shellpiper')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mrfiregem/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88da5fb82cac19e45a68959cdf036a50431580588d3d6c806eb9fdc81b2b246f')

build() {
  cd "$pkgname-$pkgver"
  flit build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
