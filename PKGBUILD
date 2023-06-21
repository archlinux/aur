# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-json2xml
_name=${pkgname#python-}
pkgver=3.21.0
pkgrel=1
pkgdesc="Simple Python Library to convert JSON to XML"
arch=('any')
url="https://json2xml.readthedocs.io/"
license=('Apache')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=('python-defusedxml' 'python-urllib3' 'python')
_wheel=${pkgname//-/_}-$pkgver-py3-none-any.whl
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('c71617fe53ac650a9521d2dd05018eb0f3e6c9cd558b99f3d56439ae53f3df58e77f4fd7b5da43e4d0fa402eea275e41992220e3565eb16e1aca690366e53c30')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
