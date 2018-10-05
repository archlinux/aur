# Maintainer: minus <minus@mnus.de>

pkgname=python-pypeln
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Pypeline is a simple yet powerful python library for creating concurrent data pipelines."
arch=(any)
url="https://github.com/cgarciae/pypeln"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
makedepends=('python-setuptools')
sha256sums=('ac25af7b48516f0adb4653e7d5e2be0e88a9ff4438b33dd51d5d6a970914ac8c')

build() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
