# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-json2xml
_name=${pkgname#python-}
pkgver=6.0.7
pkgrel=1
pkgdesc="Simple Python Library to convert JSON to XML"
arch=('any')
url="https://json2xml.readthedocs.io/"
license=('Apache-2.0')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=('python-defusedxml' 'python-urllib3' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('c22c777d530150a025759624fda63047d9a5ab8c8c0b3998b80b95019cf45708dc9aa133b68f27853c350f2ce1294b4c086c94d1cacb0c5c0d5fb41a7012bff2')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
