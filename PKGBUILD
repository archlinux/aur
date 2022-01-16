# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=python-kbinxml
_name=${pkgname#python-}
pkgver=1.7
pkgrel=2
pkgdesc="Decoder/encoder for Konami's binary XML format"
arch=('any')
url="https://github.com/mon/${_name}"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
depends=('python-lxml')
makedepends=('python' 'python-setuptools')
sha256sums=('ad4224a7baa1fa205f5f747a06e35f82ebf8d2121d80465b49fd0119378a9450')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
