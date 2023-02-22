# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=adjustText
pkgname=python-adjusttext
pkgver=0.8
pkgrel=1
pkgdesc='Iteratively adjust text position in matplotlib plots to minimize overlaps'
arch=(any)
url="https://github.com/Phlya/$_name"
license=(MIT)
depends=(python python-matplotlib python-numpy)
makedepends=(python-setuptools)
options=(!emptydirs)
source=(
	"$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/Phlya/$_name/$pkgver/LICENSE"
)
sha256sums=('bb0682bb53abb626d6afc9c1db108ccb67f2c35ddc8d20ac6a802c756c07ee17'
            '443687f058d5f541952ab9bcd6f836d9843ac13b93b8a6b1097eb0832d2314fa')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
