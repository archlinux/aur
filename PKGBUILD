# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.20.0
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python-graphviz' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a50743ed9274e194e7898820f69aa12868ae217003580ef9e7d0285132c9674a')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root "$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
