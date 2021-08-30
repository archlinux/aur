# Maintainer: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: OctopusET
pkgname=norminette
pkgver=3.3.31
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('norminette-git')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgver.tar.gz"::"https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0220ef7da9eb3e06214eba00cacb4582c5fc229a04e8c3f9ec54c91b018a2a3af07c731b7f5bb78f7a8b99e733e9956af8d8f528a6faeee84bccbf6d9eda1b32')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
