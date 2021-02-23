# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.19.1
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python-graphviz' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bb77d8f7a502b1638dc3ca7b267c8e4689f56203b248590cbda3e5269f9ba659')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root "$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
