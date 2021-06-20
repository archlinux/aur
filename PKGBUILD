# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.16
pkgrel=1
pkgdesc="Simple mesh generator inspired by distmesh."
arch=('x86_64')
url="https://github.com/nschloe/dmsh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshplex' 'python-numpy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('33e28c8bdd4ea57421fcf0e8c9d02943afc8be4a701e7d237ca348d287da589261b8bc587c6f975602bad41d19409b56435f7817c3b3a0f81c45ec408c47380f')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
