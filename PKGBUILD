# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-gerbonara
_name=${pkgname#python-}
pkgver=0.10.7
pkgrel=2
pkgdesc="Pythonic library for reading/modifying/writing Gerber/Excellon/IPC-356 files"
arch=('any')
url="https://gerbolyze.gitlab.io/gerbonara"
license=('AGPL')
depends=("python-click")
makedepends=("python-setuptools" "git")
source=("${_name}-${pkgver}::git+https://gitlab.com/gerbolyze/${_name}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

