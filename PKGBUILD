# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-compression-middleware
pkgname=python-django-compression-middleware
pkgver=0.5.0
pkgrel=1
pkgdesc="Django middleware to compress responses using several algorithms"
arch=('any')
url="https://github.com/friedelwolff/django-compression-middleware"
license=('MPL2')
depends=('python'
        'python-django')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/friedelwolff/django-compression-middleware/archive/v$pkgver.tar.gz")
sha256sums=('5fcb448f915fc4629f2201750a56c1548637549232f39a16217fe57b16866a83')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"
}
