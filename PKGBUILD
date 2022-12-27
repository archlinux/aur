# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=shell-piper
pkgver=0.6.0
pkgrel=1
pkgdesc='Write a temporary file and pass it to a program'
arch=('any')
url="https://github.com/Mrfiregem/shell-piper"
license=('GPL3')
depends=('python')
makedepends=('python-flit' 'python-installer')
provides=('shellpiper')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mrfiregem/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d18d524018db53201fca375c6a7d9077d89a7c142406130fa7455f6c572abc9')

build() {
  cd "$pkgname-$pkgver"
  flit build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
