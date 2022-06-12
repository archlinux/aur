# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=gerbonara
pkgver=0.10.7
pkgrel=1
pkgdesc="Pythonic library for reading/modifying/writing Gerber/Excellon/IPC-356 files"
arch=('any')
url="https://gerbolyze.gitlab.io/gerbonara"
license=('AGPL')
depends=("python-click")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}::git+https://gitlab.com/gerbolyze/gerbonara.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

