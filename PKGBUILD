# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-defcon
_pkgname=defcon
pkgver=0.7.2
pkgrel=3
pkgdesc='A set of UFO based objects for use in font editing applications'
arch=('any')
url="https://github.com/robotools/$_pkgname"
license=('MIT')
depends=('python-fonttools' 'python-fs')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-unicodedata2')
optdepends=('python-fontpens' 'python-lxml')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('1967eaa23dcc8e1cbe3bd130aae4d9ddb72027b62d3e23eeb640065cfbd6d8d1')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
