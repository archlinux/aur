# Maintainer: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: OctopusET
pkgname=norminette
pkgver=3.2.7
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('python-norminette-git')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgver.tar.gz"::"https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('932b92d53e24cc79615ba2211275009cb3ff0bd37e8143656e436aec4e7c05c2fbf8881df0990bcafc0c3b00863046c35322c407a172d8e09a147ddb863b17cd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
