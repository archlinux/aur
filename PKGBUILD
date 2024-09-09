# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-json2xml
_name=${pkgname#python-}
pkgver=5.0.5
pkgrel=1
pkgdesc="Simple Python Library to convert JSON to XML"
arch=('any')
url="https://json2xml.readthedocs.io/"
license=('Apache-2.0')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=('python-defusedxml' 'python-urllib3' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('2df12b8c36d51fe6e89f6860e40fb449015471e0e176fa0e6dbe0c7916b2123b84d4ee29607e2f4350f87f25d62e3b586038ae18174d2bd5401f7e8c14b95cf2')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
