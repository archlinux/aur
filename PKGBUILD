# Maintainer: Niklas <dev@n1klas.net>

pkgname=python-pyhomematic
_name=pyhomematic
pkgver=0.1.43
pkgrel=1
pkgdesc="Python 3 Interface to interact with Homematic devices"
arch=('any')
url="https://github.com/danielperna84/pyhomematic"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/danielperna84/pyhomematic/archive/${pkgver}.tar.gz")
sha512sums=('c08900f8b898b9677b98f293684268c0a6b35299cbd1a7b5c1e92e873c5e59608936f476b8f472e2a920fd640c815d74f3151df1fe434aaa3b9bb806153c79dc')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
