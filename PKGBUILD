# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.17.0
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python-graphviz' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('86436166fd3a9b8dddb8ccce2716f458a55614527feedcb95ae4a8cdf5b7659f')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	cd $_name-$pkgver
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
