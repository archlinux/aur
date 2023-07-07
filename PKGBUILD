# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>

pkgname=python-slicer
pkgver=0.0.7
pkgrel=2
pkgdesc='Wraps tensor-like objects and provides a uniform slicing interface via __getitem__'
arch=(any)
url='https://github.com/interpretml/slicer'
license=(BSD)
depends=(
  python
  python-numpy
  python-pandas
  python-pytest
  python-scipy
)
makedepends=(
  python-setuptools
  python-wheel
)
optdepends=(
  python-pytorch
)
_archive="${pkgname#python-}-$pkgver"
source=("${url}/archive/v${pkgver}/${_archive}.tar.gz")
sha256sums=('66e698dbe779d5597771c53809aa5e3a1eeb94f4386105e1bb8f3eeab3b3d339')

package() {
	cd $_archive
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
