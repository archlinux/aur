# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=5.8
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1a386acb02b4b644b8b008b99d18b538a759432dfd188059713e75e09eb243c6c3789ae88a48687e79b42e8f8ac23a53b8a5a6c0c16d76795054383de078aa14')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE.txt
}
