# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-json2xml
_name=${pkgname#python-}
pkgver=6.0.5
pkgrel=1
pkgdesc="Simple Python Library to convert JSON to XML"
arch=('any')
url="https://json2xml.readthedocs.io/"
license=('Apache-2.0')
makedepends=('python-setuptools')  # unless it only requires distutils
depends=('python-defusedxml' 'python-urllib3' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('53748ed506e860a661663b540391ae4e707961be1fa6bcfb267479509a169258aa43e6e39930f48975cc7db59cfff209a0506e8dff1c6a49ef646ece859d128a')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
