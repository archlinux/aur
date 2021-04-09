# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=6.0
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('cd274a38a343550ea5e1531dafb798555082cec3a2c55315992885e457492c96bd22216fe110f88073ae1c7013ca216862c3339006d498c03a1adfc59dbbb1c8')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE.txt
}
