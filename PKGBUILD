# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-shutilwhich
pkgver=1.1.0
pkgrel=8
pkgdesc="Backport of shutil.which"
url="https://github.com/mbr/shutilwhich"
arch=('any')
license=('PSF')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mbr/shutilwhich/archive/${pkgver}.tar.gz")
sha256sums=('4292a973312c58ca1935ea75d7bd378b17668ef6aacfc812d00019e0726dea44')

build(){
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py build
}

package() {
  cd "shutilwhich-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
