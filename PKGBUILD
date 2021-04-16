# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=6.0.1
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('9842663b1aeb78acce1e191b5d51b1e587f8177ba334371b840723b8b61835e99ef01cba8a6b6de7da94b133d8dd2dc4077f9ca2ac0adf4d99a0d8ddfd6464bf')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE.txt
}
