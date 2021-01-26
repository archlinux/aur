# Maintainer: OctopusET
pkgname=python-norminette-git
pkgver=r334.2cdcfd5
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
depends=('python-argparse')
makedepends=('git' 'python-setuptools')
source=("$pkgname"::'git+https://github.com/42School/norminette.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
