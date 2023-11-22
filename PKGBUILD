# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=6.1.3
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2c2a8ec537895f70183b39db80ba163053745afe9ffe9d9d51334debc29808c0fc48193edeca397d4e3a9566d885ac222b08f3b0472ff35b3450c882647cde2f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE.txt
}
