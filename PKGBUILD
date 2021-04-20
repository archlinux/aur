# Maintainer: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: OctopusET
pkgname=norminette
pkgver=3.2.95
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('python-norminette-git')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgver.tar.gz"::"https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0dd6814f1cbfa6acab59b07b8ce7fb0fac7c2473e170ade86ddf66b95553743858c333276e02a8444941c1134aa10b92513352e54287ee3c4984c1bce43fe194')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
