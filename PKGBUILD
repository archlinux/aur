# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pcpp
pkgname=python-$_name
pkgver=1.22
pkgrel=1
pkgdesc='A C99 preprocessor with partial preprocessing capabilities writen in Python'
arch=('any')
url="https://github.com/ned14/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d7d7df201fe643a44b2fb2fd967aaa8a84608aa2d3511d87abad0cc54bfc0141')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
