# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.1.2
pkgrel=1
pkgdesc="Modelling Active Galactic Nuclei radiative processes with python"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy' 'python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/agnpy/agnpy-$pkgver.tar.gz")
sha256sums=('445b9ddffc61691c53c309bdaf6f44ac609f0f227faa55f16f8e69e6a2a0aa4d')

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
