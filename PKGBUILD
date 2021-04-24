# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.13
pkgrel=1
pkgdesc="Simple mesh generator inspired by distmesh."
arch=('any')
url="https://github.com/nschloe/dmsh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshplex' 'python-numpy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2d0f35bc9b53d58276776498b7fa9c05646a0a3641fa552ec4ca73d1f8e8bd9b')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
