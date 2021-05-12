# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-dmsh
_name=dmsh
pkgver=0.2.14
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
sha256sums=('6296c514dc7db8dbbedfcbd2b0aadfb8b5a3415241985eaa9f88686a635f6eca')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
