# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('python-ipadic')
_name=('ipadic')
pkgver=1.0.0
pkgrel=1
pkgdesc="IPAdic packaged for easy use from Python"
url="https://github.com/polm/ipadic-py"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a32f925d8e9ff0cdb58a90410cbdd463494dd82b0e60a21355bfc53444f044d00dba3bd031370b159b1ddadcca1a48fc896726ee0c6b435c1dafeb9804604785')
arch=('any')
depends=('python')
makedepends=('python-setuptools')

build(){
        cd "${_name}-${pkgver}"
        python setup.py build
}

package(){
        cd "${_name}-${pkgver}"
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build
        # No license file provided but project states it is licensed under the MIT
}
