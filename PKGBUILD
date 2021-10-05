# Maintainer: Esteban López Rodríguez <gnu_stallman at protonmail dot ch>
# Contributor: OctopusET
pkgname=norminette
pkgver=3.3.40
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('norminette-git')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgver.tar.gz"::"https://github.com/42School/norminette/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('5dd424024a53ef51e86c437d71bec0b05b4bf3e0dbf6c1df5602f210c8ed8b3c6056d70475251eee2efc95b86e988d9f1a41773c796a6c61281b6dc4219ae11b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
