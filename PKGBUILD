# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.1.1
pkgrel=1
pkgdesc="Modelling Active Galactic Nuclei radiative processes with python"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy>=4.0' 'python-numpy>=1.17' 'python-matplotlib' 'python-scipy>=1.2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/agnpy/agnpy-$pkgver.tar.gz")
sha256sums=('934e7526228ea6bc5c4731318b657d71767027ad15a4588926e3edcc699147e1')

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
