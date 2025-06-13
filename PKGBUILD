# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-json2xml
_name=${pkgname#python-}
pkgver=5.1.0
pkgrel=1
pkgdesc="Simple Python Library to convert JSON to XML"
arch=('any')
url="https://json2xml.readthedocs.io/"
license=('Apache-2.0')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=('python-defusedxml' 'python-urllib3' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('0fe80942c94042c47c943c1b4b129903352f9a12d991ac6042e3eb9b3d38389c5217cfa7307c8fe267fdb75d99471749c6385454caf87aa688c61225141d7318')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
