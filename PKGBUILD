# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>

_pkgname=swagger_ui_bundle
pkgname=python-$_pkgname
pkgver=0.0.6
pkgrel=1
pkgdesc='bundled swagger-ui pip package'
arch=('any')
url='https://github.com/dtkav/swagger_ui_bundle'
license=('Apache')
depends=('python-jinja>=2.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2172bc039d1b4ad603412b1298211d738384d94df47612fb384da10fb69bf71f6b37c5afdcbe94dbe7b5c4df1495d43801cc11b2d4bebc8783f4d3442676f62f')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
