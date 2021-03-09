# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-defcon
_pkgname=defcon
pkgver=0.8.0
pkgrel=1
pkgdesc='A set of UFO based objects for use in font editing applications'
arch=('any')
url="https://github.com/robotools/$_pkgname"
license=('MIT')
depends=('python-fonttools' 'python-fs')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-unicodedata2')
optdepends=('python-fontpens' 'python-lxml')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('cab2d983b138f8afbdf18738dea9267887f123e75b4bc3fcb2ae9c9a463c1209')

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
