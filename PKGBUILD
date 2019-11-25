# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-meld3
_libname=meld3
pkgver=1.0.2
pkgrel=2
pkgdesc="An HTML/XML templating engine"
arch=('any')
url="https://github.com/supervisor/meld3"
license=('Repoze')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
sha256sums=('f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558')

build() {
    cd "$srcdir"/meld3-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/meld3-$pkgver
    python setup.py install -O1 --skip-build --prefix=/usr --root="$pkgdir"
    install -m0644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
