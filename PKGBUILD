# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.3.1
pkgrel=1
pkgdesc='Generate ctags-compatible tags files for Markdown documents'
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/jszakmeister/$pkgname"
license=('BSD3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3355c0d5d4186b825e7096a8ca2f1712d1544ec4b7dd22b2e0e56787ccf0a286')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst
}
