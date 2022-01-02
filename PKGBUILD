# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=python-python-magic
pkgver=0.4.24
pkgrel=1
arch=('any')
url="https://pypi.org/project/python-magic/"
license=("MIT")
pkgdesc="File type identification using libmagic"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/python-magic/python-magic-${pkgver}.tar.gz")
sha256sums=('de800df9fb50f8ec5974761054a708af6e4246b03b4bdaee993f948947b0ebcf')

build(){
    cd python-magic-$pkgver
    python setup.py build
}

package(){
    cd python-magic-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
