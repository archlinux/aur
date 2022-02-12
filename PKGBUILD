# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=python-rtfunicode
pkgver=2.0
pkgrel=1
pkgdesc="Encoder for unicode to RTF 1.5 command sequences"
arch=('any')
url="https://pypi.org/project/rtfunicode/"
license=('BSD')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
depends=('python')
makedepends=('python-setuptools')
sha256sums=('97d2e860fd4abaae2de5df1e59bb18b85ba0caebf40c53de8ddb79ec8d884401')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
