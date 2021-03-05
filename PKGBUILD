# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.11
pkgrel=1
pkgdesc="Simple mesh generator inspired by distmesh."
arch=('any')
url="https://github.com/nschloe/optimesh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshplex' 'python-numpy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('42dcd07fd597d73ce4b33cdc8b5410af92ead22f5d1e721c7107f083d1710e60')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
