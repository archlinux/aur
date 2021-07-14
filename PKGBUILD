# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.1.0
pkgrel=1
pkgdesc="Modelling Active Galactic Nuclei radiative processes with python"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy' 'python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/agnpy/agnpy-$pkgver.tar.gz")
sha256sums=('175f4aca49d7b670f00cd33233cdb7043338b48edde3f3503798514fb37b83bd')

build() {
	cd "agnpy-$pkgver"
	python setup.py build
}

package() {
	cd "agnpy-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
