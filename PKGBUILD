# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>

_pkgname=swagger_ui_bundle
pkgname=python-$_pkgname
pkgver=0.0.8
pkgrel=1
pkgdesc='bundled swagger-ui pip package'
arch=('any')
url='https://github.com/dtkav/swagger_ui_bundle'
license=('Apache')
depends=('python-jinja>=2.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0a5e176c79cc7ed7108965b159cee69a11e0ac896741af5462a7f8e184ba7599c22015077f478780d4954c462e37da708ee746b57b1af6edcb2de7bbac4ddad3')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
