# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

pkgname=python-daftlistings
_name=daftlistings
pkgver="2.0.5"
pkgrel=1
pkgdesc="A library that enables programmatic interaction with daft.ie. Daft.ie has nationwide coverage and contains about 80% of the total available properties in Ireland."
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('MIT')
depends=('python' 'python-folium')
makedepends=('python-setuptools')
_source_hash="2c75951187f49eca8070dd1b7dbe1de35c45f2e6fd7565149d407c51eebd770f"
source=("https://files.pythonhosted.org/packages/${_source_hash::2}/${_source_hash:2:2}/${_source_hash:4:60}/${_name}-${pkgver}.tar.gz")
sha256sums=('1c5bc3bd4fe9dae2ca38ef841c7630a6dfdcf49db550372de739c17bd34a052f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
