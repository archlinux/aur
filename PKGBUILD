# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=shell-piper
pkgver=0.7.2
pkgrel=1
pkgdesc='Write a temporary file and pass it to a program'
arch=('any')
url="https://github.com/Mrfiregem/shell-piper"
license=('GPL3')
depends=('python')
optdepends=('python-rich: colorful log messages')
makedepends=('python-flit' 'python-installer')
provides=('shellpiper')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mrfiregem/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a76b08633cb8a8023da533fe683c1c1142dcc1144a150fa14a01265d1846271')

build() {
  cd "$pkgname-$pkgver"
  flit build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
