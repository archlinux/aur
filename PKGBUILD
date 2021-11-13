# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot com>

pkgname=python-norminette
pkgver=r531.921b5e2
pkgrel=1
pkgdesc="Open source norminette"
arch=('any')
url='https://github.com/42School/norminette'
license=('MIT')
conflicts=('norminette')
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
